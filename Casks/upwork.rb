cask "upwork" do
    arch arm: "arm64", intel: "x64"
    version "5.8.0.35_be1a1520901c4eef"
    sha256 arm: "19a455b6d97d239a1f914f075f365c199077d2ac3e90a0658b3a3a45c6a450f5",
           intel: "19a455b6d97d239a1f914f075f365c199077d2ac3e90a0658b3a3a45c6a450f5"
  
    url "https://upwork-usw2-desktopapp.upwork.com/binaries/v#{version.dots_to_underscores}/Upwork.dmg",
        user_agent: :fake,
        referer: "https://www.upwork.com/ab/downloads"
    name "Upwork"
    desc "Desktop app for Upwork"
    homepage "https://www.upwork.com/"
    auto_updates true
    livecheck do
      url :url
    end
  
    app "Upwork.app"
  
    zap trash: [
      "~/Library/Application Support/Upwork",
      "~/Library/Preferences/com.upwork.Upwork.plist",
      "~/Library/Saved Application State/com.upwork.Upwork.savedState"
    ]
  end  
