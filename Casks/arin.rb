cask "arin" do
  version "0.3.0"
  sha256 "7373c31563396e69a32eb96c8e3b0ba8366f847d25c3130dfcfb414e16a1cd29"

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
