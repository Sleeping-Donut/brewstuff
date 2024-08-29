cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.32"
  sha256 arm:   "3b9ab978317a780f2f8f23976f95f190dafc258144cbfe9e45dba6589aad5faa",
         intel: "defde5572cb6310c57dbfb09f1e9bd00283498b538623545b797096b2b1bc7a7"

  url "https://github.com/zen-browser/desktop/releases/download/#{version}/zen.macos-#{arch}.dmg",
      verified: "github.com/zen-browser/desktop/"
  name "Zen Browser"
  desc "Fully open-source browser based on the Firefox engine"
  homepage "https://www.zen-browser.app/"

  livecheck do
    url :url
    strategy :github_latest do |json|
      json["tag_name"].match(/^v?(\d+(?:\.\d+)+(-a\.\d+)?)$/i)[0]
    end
  end

  depends_on macos: ">= :catalina"

  app "Zen Browser.app"

  zap trash: [
    "~/Library/Application Support/zen",
    "~/Library/Caches/zen",
    "~/Library/Caches/Mozilla/updates/Applications/Zen Browser/",
    "~/Library/Preferences/org.mozilla.com.zen.browser.plist",
    "~/Library/Saved Application State/org.mozilla.com.zen.browser.savedState",
  ]

  caveats <<~EOS
    According to https://github.com/zen-browser/desktop/issues/53
    this app will not work with quarantine attributes.
    Bypass gatekeeper: 'xattr -d com.apple.quarantine '/Applications/Zen Browser.app/'
  EOS
end

