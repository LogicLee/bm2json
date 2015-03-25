# Author : Nigel Lee, March 2015
# Purpose: Convert Chrome browser bookmarks HTML file to JSON
# Usage  : (1) Export bookmarks from browser in HTML format
#          (2) Use Node.js or other web server to host the html file
#          (3) Change the WebRequest line to point to your web server URL and run this script

$page = Invoke-WebRequest "http://127.0.0.1:8125/"
$bookmarks = $page.ParsedHtml.links

cls
$count = 0
write-host "Start convert to JSON..."
write-host "["
foreach($bookmark in $bookmarks)
{       
	$count++
    $name = $bookmark.innerText
    $url = $bookmark.href
    $folder = $bookmark.parentNode.previousSibling.parentNode.previousSibling.innerText

    write-host "  {"
    write-host "    `"name`"   : `"$name`","
    write-host "    `"url`"    : `"$url`","
    write-host "    `"folder`" : `"$folder`""
    write-host "  },"
    write-host ""
}
write-host "]"

write-host "Finished converting" $count "bookmarks"
