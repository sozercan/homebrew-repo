cask "arin" do
  version "0.1.0"
  sha256 "11146fb0fba4a80cd7c20252d53b15763f151fb1a86dc937bd697d1c07488b76"

  url "https://github.com/sozercan/arin/releases/download/v#{version}/arin-v#{version}.dmg"
  name "Arin"
  desc "Finds caches, build output and stale worktrees that are safe to delete"
  homepage "https://github.com/sozercan/arin"

  depends_on macos: :tahoe

  app "Arin.app"
  binary "#{appdir}/Arin.app/Contents/Helpers/arin"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Arin.app"], sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.sertacozercan.Arin.plist",
    "~/Library/Saved Application State/com.sertacozercan.Arin.savedState",
  ]
end
