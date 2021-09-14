find . -type d -name "\[NODELETE\]\[ADDON\]*" -exec bash -c 'mv "$1" "`echo $1 | sed \"s/.\/\[NODELETE\]\[ADDON\]/[ADDON]/\"`"' -- '{}' \;

cd ../profiles
find . -type f -name "modlist.txt" -exec sed -i "s|\[NODELETE\]\[ADDON\]|\[ADDON\]|g"  {} +