cask "kaset" do
  version "0.12.0"
  sha256 "9702b145471fae8f34191e660a56a3efe7ce4603aa27c21cd0a22d83729d8b96"

  url "https://github.com/sozercan/kaset/releases/download/v#{version}/kaset-v#{version}.dmg"
  name "Kaset"
  desc "Native YouTube Music client"
  homepage "https://github.com/sozercan/kaset"

  auto_updates true
  # Homebrew casks can gate on macOS release symbols, but not this
  # app's exact 15.4 patch minimum; LSMinimumSystemVersion and
  # Sparkle's appcast enforce 15.4 at launch/update time.
  depends_on macos: :sequoia

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
