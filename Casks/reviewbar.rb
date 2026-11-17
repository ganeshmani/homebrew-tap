cask "reviewbar" do
  version "1.0.6"
  sha256 "ccd6ffae958a128a562fcbd88139915075be6da3fce4aed9c64aed467f70a52c"

  url "https://github.com/ganeshmani/reviewbar/releases/download/v#{version}/ReviewBar-#{version}.dmg"
  name "ReviewBar"
  desc "Menu bar app for AI reviews of GitLab MRs and GitHub PRs"
  homepage "https://github.com/ganeshmani/reviewbar"

  depends_on macos: :sonoma

  app "ReviewBar.app"

  uninstall quit: "dev.reviewbar.ReviewBar"

  zap trash: [
    "~/Library/Application Support/ReviewBar",
    "~/Library/Preferences/dev.reviewbar.ReviewBar.plist",
  ]

  caveats <<~EOS
    ReviewBar needs a logged-in `claude` (Claude Code) or `codex` CLI,
    plus `glab` / `gh` or a personal access token.

    This build is signed but not yet notarized. If macOS blocks the first launch,
    use System Settings > Privacy & Security > Open Anyway, or run:
      xattr -dr com.apple.quarantine /Applications/ReviewBar.app
  EOS
end
