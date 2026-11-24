cask "vekil" do
  version "0.16.0"
  sha256 "e4d015297613ad4d45cae936170047cdb3b2a093bfabb77d561d2d52fdb71dc8"

  url "https://github.com/sozercan/vekil/releases/download/v#{version}/vekil-macos-arm64.zip"
  name "Vekil"
  desc "Proxy Anthropic, Gemini, and OpenAI clients through GitHub Copilot"
  homepage "https://github.com/sozercan/vekil"

  depends_on arch: :arm64

  app "Vekil.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Vekil.app"], sudo: false, must_succeed: false
  end

  zap trash: [
    "~/.config/vekil",
    "~/Library/LaunchAgents/com.vekil.menubar.plist",
  ]
end
