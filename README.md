# sozercan/homebrew-repo

🍺 Homebrew tap for my projects.

## Installation

Add the tap once:

```bash
brew tap sozercan/repo
```

Then install any of the packages below.

## Available Casks

| Cask | Description |
|------|-------------|
| [ayna](https://github.com/sozercan/ayna) | Native macOS/iOS/watchOS ChatGPT client |
| [kaset](https://github.com/sozercan/kaset) | Native YouTube Music client for macOS |
| [vekil](https://github.com/sozercan/vekil) | Proxy Anthropic, Gemini, and OpenAI clients through GitHub Copilot |

Install a cask:

```bash
brew install --cask <cask-name>
# or without tapping first:
brew install --cask sozercan/repo/<cask-name>
```

## Available Formulae

| Formula | Description |
|---------|-------------|
| [a365](https://github.com/sozercan/a365cli) | CLI for Microsoft 365 via agent365 MCP servers |

Install a formula:

```bash
brew install <formula-name>
# or without tapping first:
brew install sozercan/repo/<formula-name>
```

## Updating

```bash
brew update
brew upgrade
```

## Uninstalling

```bash
brew uninstall <name>
brew untap sozercan/repo
```
