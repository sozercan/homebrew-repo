cask "kaset" do
  version "0.10.2"
  sha256 "73d719b7be7bcfff807e6fa4e37234589d511deacc6d550bb75cea205539df9a"

  url "https://github.com/sozercan/kaset/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset"
  desc "Native YouTube Music client"
  homepage "https://github.com/sozercan/kaset"

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "Kaset.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Kaset.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Kaset",
    "~/Library/Caches/com.sertacozercan.Kaset",
    "~/Library/Preferences/com.sertacozercan.Kaset.plist",
    "~/Library/Saved Application State/com.sertacozercan.Kaset.savedState",
    "~/Library/WebKit/com.sertacozercan.Kaset",
  ]
end
