cask "notecast-editor" do
  version "0.2.0"
  sha256 "c24836e912397e43de158e83b67be0a2693c6da4bd2046c4ee2c169a48bcbd47"

  url "https://github.com/AlexWasHeree/notecast-editor-app/releases/download/v#{version}/NoteCast-Editor.dmg"
  name "NoteCast Editor"
  desc "Floating markdown notepad opened with a global shortcut"
  homepage "https://github.com/AlexWasHeree/notecast-editor-app"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NoteCast Editor.app"

  uninstall quit:       "com.notecasteditor.app",
            login_item: "NoteCast Editor"

  zap trash: [
    "~/Library/Application Support/NoteCastEditor",
    "~/Library/Preferences/com.notecasteditor.app.plist",
  ]

  caveats <<~EOS
    NoteCast Editor is not notarized by Apple yet. On first launch macOS will block it:
    open System Settings → Privacy & Security and click "Open Anyway". Only needed once.

    Then press ⌘⇧Space from any app.
  EOS
end
