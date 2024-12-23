cask "paragon-ntfs@15" do
  version "15"
  sha256 "b046b3066757c8ca6eea033fe16e7986aacd71a538f9620075a003827b0e8073"

  url "https://dl.paragon-software.com/demo/ntfsmac#{version}_trial.dmg"
  name "Paragon NTFS for Mac"
  desc "Paragon read-write NTFS driver"
  homepage "https://www.paragon-software.com/ufsdhome/ntfs-mac/"

  conflicts_with cask: [
    "paragon-ntfs",
  ]

  depends_on macos: "<= :sonoma"
  
  # livecheck do
  #   url :homepage
  #   regex(%r{href=.*?/ntfsmac(\d+)_trial\.dmg}i)
  # end

  auto_updates true

  installer manual: "FSInstaller.app"

  uninstall kext:      "com.paragon-software.filesystems.ntfs",
            launchctl: "com.paragon-software.ntfs*",
            pkgutil:   "com.paragon-software.pkg.ntfs",
            quit:      "com.paragon-software.ntfs*",
            signal:    [
              ["KILL", "com.paragon-software.ntfs.FSMenuApp"],
              ["KILL", "com.paragon-software.ntfs.notification-agent"],
            ],
            delete:    [
              "/Library/Application Support/Paragon Software/com.paragon-software.kernelio.kext",
              "/Library/Application Support/Paragon Software/uc.ntfs",
              "/Library/LaunchDaemons/com.paragon-software.installer.plist",
              "/Library/PrivilegedHelperTools/com.paragon-software.installer",
            ],
            rmdir:     "/Library/Application Support/Paragon Software/"

  zap trash: [
    "~/Library/Application Support/com.paragon-software.ntfs.*",
    "~/Library/Caches/com.paragon-software.ntfs.fsapp",
    "~/Library/HTTPStorages/com.paragon-software.ntfs.*",
    "~/Library/Preferences/com.paragon-software.ntfs.fsapp.plist",
    "~/Library/Saved Application State/com.paragon-software.ntfs.fsapp.savedState",
    "~/Library/WebKit/com.paragon-software.ntfs.fsapp",
  ]
end
