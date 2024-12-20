cask "upwork" do
    arch arm: "arm64", intel: "x64"
    version "5.8.0.35,be1a1520901c4eef"
    sha256 arm: "19a455b6d97d239a1f914f075f365c199077d2ac3e90a0658b3a3a45c6a450f5",
           intel: "19a455b6d97d239a1f914f075f365c199077d2ac3e90a0658b3a3a45c6a450f5"
  
    url "https://upwork-usw2-desktopapp.upwork.com/binaries/v#{version.csv.first.dots_to_underscores}_#{version.csv.second}/Upwork.dmg",
        user_agent: :fake,
        referer: "https://www.upwork.com/ab/downloads"
    name "Upwork"
    desc "Desktop app for Upwork"
    homepage "https://www.upwork.com/"
    
    livecheck do
        url "https://upwork-usw2-desktopapp.upwork.com/binaries/versions-mac.json"
        strategy :page_match do |page|
          match = page.match(%r{/v(\d+(?:_\d+)*)_([^/]+)/Upwork\.dmg}i)
          next if match.blank?
    
          "#{match[1].tr("_", ".")},#{match[2]}"
        end
    end
  
    app "Upwork.app"

    zap trash: [
        "~/Library/Application Support/CrashReporter/Upwork_*",
        "~/Library/Application Support/Upwork",
        "~/Library/Caches/Upwork",
        "~/Library/Logs/Upwork",
        "~/Library/Preferences/com.upwork.Upwork.plist",
        "~/Library/Saved Application State/com.upwork.upwork.savedState",
    ]
  end
