# homebrew-claude-light

Homebrew tap for [Claude Light](https://github.com/fr1j0/claude-light) — a native macOS menu-bar status light for your Claude Code sessions (🔴 needs input · 🟠 running · 🟢 idle/finished).

## Install

```sh
brew tap fr1j0/claude-light
brew trust fr1j0/claude-light   # newer Homebrew requires trusting third-party taps
brew install --cask claude-light
```

Then launch Claude Light and choose **Install Claude Code hooks** from the menu (or accept the first-run prompt) to wire it into `~/.claude/settings.json`.

> **Note — unsigned interim builds:** releases are currently ad-hoc signed while Apple notarization for the team is pending, so on first launch Gatekeeper may report the app as *"damaged and can't be opened"*. Clear the quarantine flag and launch again:
>
> ```sh
> xattr -dr com.apple.quarantine "/Applications/Claude Light.app"
> ```
>
> Signed & notarized releases will remove this step once notarization is enabled.

## Update

```sh
brew upgrade --cask claude-light
```

There is no auto-update or in-app update check — updates only arrive through Homebrew (or by downloading a newer release manually).

## Updating the cask per release

On each release of `fr1j0/claude-light`, run [`scripts/bump-cask.sh`](https://github.com/fr1j0/claude-light/blob/main/scripts/bump-cask.sh) from that repo with a checkout of this tap:

```sh
scripts/bump-cask.sh <version> --tap /path/to/homebrew-claude-light
```

It downloads the release zip, **verifies** its sha256 against the published checksum, and rewrites `version` + `sha256` in both casks. Then commit and open a PR in each repo.
