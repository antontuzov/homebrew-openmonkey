# homebrew-openmonkey

The Homebrew tap for [OpenMonkey](https://github.com/antontuzov/OpenMonkey), the
local-first AI agent.

## Install

```bash
brew install --cask antontuzov/openmonkey/openmonkey
```

Homebrew taps this repository automatically. The cask pins a release and verifies
its SHA-256 before installing, so what lands in `/Applications` is byte-for-byte
the disk image the tag pipeline published.

The published build is **not signed with an Apple Developer ID**, so Gatekeeper
questions it once. After installing:

```bash
xattr -dr com.apple.quarantine /Applications/OpenMonkey.app
```

## Uninstall

```bash
brew uninstall --cask openmonkey        # takes the app, keeps your data
brew uninstall --zap --cask openmonkey  # also removes the data folder and caches
```

Your chats live in `~/Library/Application Support/OpenMonkey`; only `--zap`
removes them.

## Updating the cask

After a release is published, from a checkout of the main repository:

```bash
node scripts/bump-cask.mjs --tag v0.9.3 --cask /path/to/homebrew-openmonkey/Casks/openmonkey.rb
```

The script reads the release's own SHA-256 digest from the GitHub API and rewrites
`version` and `sha256` — it never downloads the disk image. Commit and push the
result; this tap's CI audits the cask, installs it on a macOS runner, reads the
bundle id back, and uninstalls it again.