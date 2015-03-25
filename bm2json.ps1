# Author : Nigel Lee, March 2015
# Purpose: Convert Chrome browser bookmarks HTML file to JSON
# Usage  : (1) Export bookmarks from browser in HTML format
#          (2) Use Node.js or other web server to host the html file
#          (3) Change the WebRequest line to point to your web server URL and run this script

$page = Invoke-WebRequest "http://127.0.0.1:8125/"
$bookmarks = $page.ParsedHtml.links

cls
$count = 0
write-host "Start convert to JSON...`r`n"
write-host "[`r`n"
foreach($bookmark in $bookmarks)
{       
	$count++
    $name = $bookmark.innerText
    $url = $bookmark.href
    $folder = $bookmark.parentNode.previousSibling.parentNode.previousSibling.innerText

    write-host "  {`r`n"
    write-host "    'name'   : '$name'`r`n"
    write-host "    'url'    : '$url'`r`n"
    write-host "    'folder' : '$folder'`r`n"
    write-host "  }`r`n"
    write-host "`r`n"
}
write-host "]`r`n"

write-host "Finished converting" $count " bookmarks"
