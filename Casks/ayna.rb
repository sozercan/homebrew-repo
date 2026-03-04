cask "ayna" do
  version "0.3.0"
  sha256 "53d871bb2be1b4874aa6bdb8400385356700481d49fb94417ae09d3b118e4a1a"

  url "https://github.com/sozercan/ayna/releases/download/v#{version}/ayna-v#{version}.dmg"
  name "Ayna"
  desc "Native macOS/iOS/watchOS ChatGPT client"
  homepage "https://github.com/sozercan/ayna"

  auto_updates true
  depends_on macos: ">= :sonoma"

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
