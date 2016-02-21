--https://dev.evernote.com/doc/articles/applescript.php

on run lstParameters
	--Get the parameters passed to the script - this is the search query
	set strSearchCriteria to SpaceList(lstParameters)
	
	--Open a new Evernote window populated by the search query
	tell application "Evernote"
		--open collection window with query string strSearchCriteria
		activate
		set query string of window 1 to strSearchCriteria
	end tell
end run

--Take a list of text items and return them as a string with a space between each item
on SpaceList(astrItems)
	--Store what the current list delimiter is
	set tmpDelimiters to AppleScript's text item delimiters
	
	--Set the list delimiter to a space and build the string we want to pass back
	set AppleScript's text item delimiters to " "
	set strReturn to astrItems as string
	
	--Set the list delimiter back to what it was previously
	set AppleScript's text item delimiters to tmpDelimiters
	
	--Return the string we built
	return strReturn
end SpaceList

