cask "zen-browser" do
  arch arm: "aarch64", intel: "x64"

  version "1.0.0-a.29"
  sha256 arm:   "3692d75e19a6258a5bda566846ae2a37645ecf52995406200529072f8de88314",
         intel: "5cf62a29306c3b84b7cd89ba981e13173457106890ff8cfed103df023121cee1"

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

