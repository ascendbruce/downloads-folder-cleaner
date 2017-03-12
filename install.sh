export DEFAULT_SCRIPT_DIR="$HOME/Library/Scripts"
export PLIST_DIR="$HOME/Library/LaunchAgents"
export PLIST_FILE="$PLIST_DIR/net.bruceli.downloads-folder-cleaner.plist"

read -r -p "Which directory do you want to place the script in? Hit enter to accept default value ($DEFAULT_SCRIPT_DIR): " SCRIPT_DIR
if [ "$SCRIPT_DIR" == "" ]; then
  export SCRIPT_DIR=$DEFAULT_SCRIPT_DIR
fi

mkdir -p $SCRIPT_DIR
export SCRIPT_PATH="$SCRIPT_DIR/downloads-folder-cleaner.applescript"

cd $SCRIPT_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/downloads-folder-cleaner.applescript

cd $PLIST_DIR
curl -OfL https://raw.githubusercontent.com/ascendbruce/downloads-folder-cleaner/master/templates/net.bruceli.downloads-folder-cleaner.plist
echo $SCRIPT_PATH
echo $PLIST_FILE
sed -i '' "s#SCRIPT_PATH#$SCRIPT_PATH#" $PLIST_FILE

launchctl unload $PLIST_FILE > /dev/null 2>&1
launchctl load -w $PLIST_FILE
