cask "ghostty@tip" do
  version "tip"
  sha256 :no_check
  depends_on macos: ">= :monterey"

  url "https://github.com/ghostty-org/ghostty/releases/download/#{version}/Ghostty.dmg"
  desc "👻 Ghostty is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration."
  homepage "https://ghostty.org/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Ghostty.app"
  binary "#{appdir}/Ghostty.app/Contents/MacOS/ghostty"
  
  binary "#{appdir}/Ghostty.app/Contents/Resources/fish/vendor_completions.d/ghostty.fish",
         target: "#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d/ghostty.fish"
  binary "#{appdir}/Ghostty.app/Contents/Resources/zsh/site-functions/_ghostty",
         target: "#{HOMEBREW_PREFIX}/share/zsh/site-functions/_ghostty"
  binary "#{appdir}/Ghostty.app/Contents/Resources/bash-completion/ghostty.bash",
         target: "#{HOMEBREW_PREFIX}/etc/bash_completion.d/ghostty"
  binary "#{appdir}/Ghostty.app/Contents/Resources/terminfo/67/ghostty",
         target: "#{ENV.fetch("TERMINFO", "~/.terminfo")}/67/ghostty"
  binary "#{appdir}/Ghostty.app/Contents/Resources/terminfo/78/xterm-ghostty",
         target: "#{ENV.fetch("TERMINFO", "~/.terminfo")}/78/xterm-ghostty"
  
  manpage "#{appdir}/Ghostty.app/Contents/Resources/man/man1/ghostty.1"
  manpage "#{appdir}/Ghostty.app/Contents/Resources/man/man5/ghostty.5"

  zap trash: [
    "~/.config/ghostty/",
    "~/Library/Caches/com.mitchellh.ghostty",
    "~/Library/HTTPStorages/com.mitchellh.ghostty",
    "~/Library/Preferences/com.mitchellh.ghostty.plist",
    "~/Library/Saved Application State/com.mitchellh.ghostty.savedState",
    "~/Library/WebKit/com.mitchellh.ghostty",
  ]
end
