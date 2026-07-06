# homebrew-hive-light

Homebrew tap for [Hive Light](https://github.com/fr1j0/hive-light) — a native macOS menu-bar status light for your Claude Code sessions (🔴 needs input · 🟠 running · 🟢 idle/finished).

## Install

```sh
brew tap fr1j0/hive-light
brew trust fr1j0/hive-light   # newer Homebrew requires trusting third-party taps
brew install --cask hive-light
```

Then launch Hive Light and choose **Install Claude Code hooks** from the menu (or accept the first-run prompt) to wire it into `~/.claude/settings.json`.

> **Note — unsigned interim builds:** releases are currently ad-hoc signed while Apple notarization for the team is pending, so on first launch Gatekeeper may report the app as *"damaged and can't be opened"*. Clear the quarantine flag and launch again:
>
> ```sh
> xattr -dr com.apple.quarantine "/Applications/Hive Light.app"
> ```
>
> Signed & notarized releases will remove this step once notarization is enabled.

## Update

```sh
brew upgrade --cask hive-light
```

There is no auto-update or in-app update check — updates only arrive through Homebrew (or by downloading a newer release manually).

## Coming from Claude Light?

Hive Light is the same app, renamed ([fr1j0/hive-light#133](https://github.com/fr1j0/hive-light/issues/133)). The old `claude-light` cask is frozen at 0.20.0 and deprecated — switch with:

```sh
brew uninstall --cask claude-light
brew install --cask fr1j0/hive-light/hive-light
```

Your settings, session state, and Claude Code hooks migrate automatically on Hive Light's first launch.

## Updating the cask per release

The cask is mirrored automatically: on each release of [`fr1j0/hive-light`](https://github.com/fr1j0/hive-light), the release workflow's "Mirror cask to Homebrew tap" step rewrites `version` + `sha256` here. If that step fails, run [`scripts/bump-cask.sh`](https://github.com/fr1j0/hive-light/blob/main/scripts/bump-cask.sh) from that repo as manual recovery:

```sh
scripts/bump-cask.sh <version> --tap /path/to/homebrew-hive-light
```

It downloads the release zip, **verifies** its sha256 against the published checksum, and renders the template cask into this tap's `Casks/hive-light.rb`. The frozen `claude-light` cask is never touched.
