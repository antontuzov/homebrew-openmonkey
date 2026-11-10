cask "openmonkey" do
  version "0.9.2"
  sha256 "5c09bf847158d5bbd94af47c1206115081ab750104f81199a1afee0c2e9e2d0b"

  url "https://github.com/antontuzov/OpenMonkey/releases/download/v#{version}/OpenMonkey-arm64.dmg"
  name "OpenMonkey"
  desc "Local-first AI agent that keeps the model on your own hardware"
  homepage "https://github.com/antontuzov/OpenMonkey"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OpenMonkey.app"

  zap trash: [
    "~/Library/Application Support/OpenMonkey",
    "~/Library/Caches/ai.openmonkey.app",
    "~/Library/HTTPStorages/ai.openmonkey.app",
    "~/Library/Preferences/ai.openmonkey.app.plist",
    "~/Library/Saved Application State/ai.openmonkey.app.savedState",
  ]

  caveats <<~EOS
    This build is not signed with an Apple Developer ID, so Gatekeeper questions it
    once. After installing, clear quarantine:
      xattr -dr com.apple.quarantine /Applications/OpenMonkey.app
  EOS
end
