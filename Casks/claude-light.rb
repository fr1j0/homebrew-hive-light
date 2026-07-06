# FROZEN farewell cask — the project was renamed to Hive Light (#133).
# This token stays at 0.20.0 forever; new releases ship as "hive-light".

cask "claude-light" do
  version "0.20.0"
  sha256 "10e1639d92248b013026fd891e3e93ee70f88616e3a14ccb9c7f18a76e02e296"

  url "https://github.com/fr1j0/claude-light/releases/download/v#{version}/claude-light.zip"
  name "Claude Light"
  desc "Menu-bar status light for Claude Code sessions"
  homepage "https://github.com/fr1j0/claude-light"

  deprecate! date: "2026-07-06", because: "was renamed to hive-light"

  depends_on macos: :ventura

  app "Claude Light.app"

  caveats <<~EOS
    Claude Light is now Hive Light (the app itself renamed for trademark
    compliance). This cask will receive no further updates. Switch with:

      brew uninstall --cask claude-light
      brew install --cask fr1j0/hive-light/hive-light

    Your settings, session state, and Claude Code hooks migrate
    automatically on Hive Light's first launch.
  EOS
end
