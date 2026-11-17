cask "reviewbar" do
  version "1.0.6"
  sha256 "8c4bdb8a85f2d3b00bae26bdef40b5c5f44841421936a5da400872c78fc84203"

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
  EOS
end
