cask "ayna" do
  version "0.4.0"
  sha256 "5ff82a1ef47af6af48238213b8890e8b523496accdd7911dedf946b6797b84e5"

  url "https://github.com/sozercan/ayna/releases/download/v#{version}/ayna-v#{version}.dmg"
  name "Ayna"
  desc "Native agentic AI client built with SwiftUI"
  homepage "https://github.com/sozercan/ayna"

  auto_updates true
  depends_on macos: :sonoma

  app "Ayna.app"

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/Ayna.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Ayna",
    "~/Library/Caches/com.sertacozercan.ayna",
    "~/Library/Preferences/com.sertacozercan.ayna.plist",
    "~/Library/Saved Application State/com.sertacozercan.ayna.savedState",
  ]
end
