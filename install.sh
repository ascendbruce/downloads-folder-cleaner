export SCRIPT_DIR="$HOME/Library/Scripts"
export SCRIPT_FILE="$SCRIPT_DIR/downloads-folder-cleaner.applescript"
export PLIST_DIR="$HOME/Library/LaunchAgents"
export PLIST_FILE="$PLIST_DIR/net.bruceli.downloads-folder-cleaner.plist"

mkdir -p $SCRIPT_DIR
mkdir -p $PLIST_DIR

echo
echo "========= Downloading =========="
echo

echo $SCRIPT_FILE
cd $SCRIPT_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/downloads-folder-cleaner.applescript
echo

echo $PLIST_FILE
cd $PLIST_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/templates/net.bruceli.downloads-folder-cleaner.plist
sed -i '' "s#SCRIPT_PATH#$SCRIPT_FILE#" $PLIST_FILE

echo
echo "===== Setting routine job ======"
echo

launchctl unload $PLIST_FILE > /dev/null 2>&1
launchctl load -w $PLIST_FILE

echo
echo "Finished"
