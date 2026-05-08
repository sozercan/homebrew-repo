cask "vekil" do
  version "0.10.6"
  sha256 "887fb2e6d2e147133f8ddccbb83bbee90a732cf100c4149a651274f6a73ad219"

  url "https://github.com/sozercan/vekil/releases/download/v#{version}/vekil-macos-arm64.zip"
  name "Vekil"
  desc "Proxy Anthropic, Gemini, and OpenAI clients through GitHub Copilot"
  homepage "https://github.com/sozercan/vekil"

  depends_on arch: :arm64

  app "Vekil.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Vekil.app"], sudo: false
  end

  zap trash: [
    "~/.config/vekil",
    "~/Library/LaunchAgents/com.vekil.menubar.plist",
  ]
end
