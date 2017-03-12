export SCRIPT_FILE="$HOME/Library/Scripts/downloads-folder-cleaner.applescript"
export PLIST_FILE="$HOME/Library/LaunchAgents/net.bruceli.downloads-folder-cleaner.plist"

launchctl unload $PLIST_FILE > /dev/null 2>&1
rm -f $PLIST_FILE
rm -f $SCRIPT_FILE

echo "Finished"
