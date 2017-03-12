export SCRIPT_DIR="$HOME/Library/Scripts"
export SCRIPT_FILE="$SCRIPT_DIR/downloads-folder-cleaner.applescript"
export PLIST_DIR="$HOME/Library/LaunchAgents"
export PLIST_FILE="$PLIST_DIR/net.bruceli.downloads-folder-cleaner.plist"

mkdir -p $SCRIPT_DIR
mkdir -p $PLIST_DIR

cd $SCRIPT_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/downloads-folder-cleaner.applescript

cd $PLIST_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/templates/net.bruceli.downloads-folder-cleaner.plist
echo $SCRIPT_FILE
echo $PLIST_FILE
sed -i '' "s#SCRIPT_PATH#$SCRIPT_FILE#" $PLIST_FILE

launchctl unload $PLIST_FILE > /dev/null 2>&1
launchctl load -w $PLIST_FILE
