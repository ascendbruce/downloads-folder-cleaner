-- # USAGE
--
--     osascript /path/to/downloads-folder-cleaner.applescript [older_than]
--
-- # OPTIONS
--
--     * older_than: time in seconds. eg. 1 day = 24*60*60 seconds => 86400

on run argv
  if (count argv) = 0 then
    set deleteIfOrderThan to 86400
  else
    set deleteIfOrderThan to item 1 of argv
  end if

  set downloadFolder to quoted form of (POSIX path of (path to downloads folder))
  set mdfindQuery to "mdfind -onlyin " & downloadFolder & " 'kMDItemDateAdded<$time.now(-" & deleteIfOrderThan & ")'"

  log "Query command: " & mdfindQuery & "\n"
  set filteredFiles to do shell script mdfindQuery

  tell application "Finder"
      repeat with filteredFile from 1 to count of paragraphs of filteredFiles
          set fileToBeDeleted to POSIX file (paragraph filteredFile of filteredFiles) as alias

          log fileToBeDeleted
          move fileToBeDeleted to trash
      end repeat
  end tell
end run
