# Downloads Folder Cleaner for Mac

Nice and clean "Downloads" folder everyday, automatically.

## Shut up and take my money

No, you don't need to pay. Here is the one-line installer (for free!!!):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/install.sh)"
```

We will walk through the detail later if you don't know how to install.

## Benefits

* No more painful spring cleaning in Downloads folder.
* No extra actions need to be taken.
* Save disk space.

## How it works

* It moves old files into Trash once a day. (Old files refer to those added into Downloads folder more than 24 hours ago)
* Still works with Macs that are in sleep mode. It will run right after waking up.
* The only thing you need to do is to move useful files to a safe place after download. The rest will be deleted within 24~48 hours automatically. (You can restore them from trash bin though)

## Install

We recommend you to do a (last) spring cleaning before installing. Otherwise all old downloads will be moved to trash regardlessly.

### One-line Installer

1. Open Applications > Utilities > Terminal.app (Or use Spotlight Search to launch it)
2. Run following command in Terminal app (Copy, Paste and hit enter):

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/install.sh)"
```

### Manual Installation

(For advanced users)

1. Download the [main script]. We recommend you to place the file at `~/Library/Scripts/downloads-folder-cleaner.applescript`
2. Download the [launchd plist file] and must save at `~/Library/LaunchAgents/net.bruceli.downloads-folder-cleaner.plist`
3. Replace string `SCRIPT_PATH` in plist file with the absolute path to main script you decided at step 1.
4. Load plist with following command:

```sh
launchctl load -w ~/Library/LaunchAgents/net.bruceli.downloads-folder-cleaner.plist
```

[main script]: https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/downloads-folder-cleaner.applescript
[launchd plist file]: https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/templates/net.bruceli.downloads-folder-cleaner.plist

## Uninstall

Run following command in Terminal app:

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/uninstall.sh)"
```

## Bugs / Questions / Suggestions?

Please feel free to report issues at <https://github.com/ascendbruce/downloads-folder-cleaner/issues>

Pull requests are also welcome!
