#!/usr/bin/env python3
"""Regenerate the Casks and Formulae tables in README.md from Casks/*.rb and Formula/*.rb.

The script replaces the content between HTML markers in README.md so it can be
safely run from CI after a new cask or formula is added.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
README = ROOT / "README.md"
CASKS_DIR = ROOT / "Casks"
FORMULA_DIR = ROOT / "Formula"

CASK_BEGIN = "<!-- CASKS:BEGIN -->"
CASK_END = "<!-- CASKS:END -->"
FORMULA_BEGIN = "<!-- FORMULAE:BEGIN -->"
FORMULA_END = "<!-- FORMULAE:END -->"


def _extract(pattern: str, text: str) -> str | None:
    m = re.search(pattern, text, re.MULTILINE)
    return m.group(1).strip() if m else None


def parse_cask(path: Path) -> tuple[str, str, str]:
    text = path.read_text(encoding="utf-8")
    name = _extract(r'^\s*cask\s+"([^"]+)"', text) or path.stem
    desc = _extract(r'^\s*desc\s+"([^"]+)"', text) or ""
    homepage = _extract(r'^\s*homepage\s+"([^"]+)"', text) or ""
    return name, desc, homepage


def parse_formula(path: Path) -> tuple[str, str, str]:
    text = path.read_text(encoding="utf-8")
    # Formula name is derived from the filename (Homebrew convention).
    name = path.stem
    desc = _extract(r'^\s*desc\s+"([^"]+)"', text) or ""
    homepage = _extract(r'^\s*homepage\s+"([^"]+)"', text) or ""
    return name, desc, homepage


def render_table(rows: list[tuple[str, str, str]], header: str) -> str:
    if not rows:
        return f"_No {header.lower()} available yet._"
    lines = [f"| {header} | Description |", "|------|-------------|"]
    for name, desc, homepage in sorted(rows, key=lambda r: r[0].lower()):
        link = f"[{name}]({homepage})" if homepage else name
        lines.append(f"| {link} | {desc} |")
    return "\n".join(lines)


def replace_block(text: str, begin: str, end: str, body: str) -> str:
    pattern = re.compile(
        re.escape(begin) + r".*?" + re.escape(end),
        re.DOTALL,
    )
    replacement = f"{begin}\n{body}\n{end}"
    if pattern.search(text):
        return pattern.sub(replacement, text)
    # If markers are missing, append the block at the end of the file.
    return text.rstrip() + "\n\n" + replacement + "\n"


def main() -> int:
    casks = [parse_cask(p) for p in sorted(CASKS_DIR.glob("*.rb"))] if CASKS_DIR.exists() else []
    formulae = [parse_formula(p) for p in sorted(FORMULA_DIR.glob("*.rb"))] if FORMULA_DIR.exists() else []

    readme = README.read_text(encoding="utf-8")
    readme = replace_block(readme, CASK_BEGIN, CASK_END, render_table(casks, "Cask"))
    readme = replace_block(readme, FORMULA_BEGIN, FORMULA_END, render_table(formulae, "Formula"))

    README.write_text(readme, encoding="utf-8")
    print(f"Updated README.md: {len(casks)} cask(s), {len(formulae)} formula(e).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
