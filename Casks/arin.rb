cask "arin" do
  version "0.2.0"
  sha256 "f7ee9610d79055e5ea04938d71322cfd4fe7adba2560330c7405ba24c0d4493e"

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
