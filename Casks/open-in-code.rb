cask "open-in-code" do
  version "2.0.0"
  sha256 "684f8b1b12f7502d9a752a79db396014d4844030e75227c60e8887a03fc3ac1d"

  url "https://github.com/sozercan/OpenInCode/releases/download/v#{version}/OpenInCode-v#{version}.zip"
  name "Open in Code"
  desc "Open the current Finder folder in Visual Studio Code"
  homepage "https://github.com/sozercan/OpenInCode"

  depends_on macos: :monterey

  app "Open in Code.app"

  zap trash: [
    "~/Library/Preferences/com.sertacozercan.openincode.plist",
    "~/Library/Saved Application State/com.sertacozercan.openincode.savedState",
  ]
end
