cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.29"
  sha256 arm:   "b9892f13bb1c8cd0c6ab0de73f923641ca0cce1bd68ecffaf683fd01fdd30251",
         intel: "934b294ba30586a31c2c62e88ef95c42312f9e0172e9977d495c909934d5ba25"

  url "https://github.com/zen-browser/desktop/releases/download/#{version}/zen.macos-#{arch}.dmg",
      verified: "github.com/zen-browser/desktop/"
  name "Zen Browser"
  desc "Fully open-source browser based on the Firefox engine"
  homepage "https://www.zen-browser.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Zen Browser.app"

  zap trash: [
    "~/Library/Application Support/zen",
    "~/Library/Caches/zen",
    "~/Library/Preferences/org.mozilla.com.zen.browser.plist",
    "~/Library/Saved Application State/org.mozilla.com.zen.browser.savedState",
  ]

  caveats <<~EOS
    According to https://github.com/zen-browser/desktop/issues/53
    this app will not work with quarantine attributes.
  EOS
end

