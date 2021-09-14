find . -type d -name "\[ADDON\]*" -exec bash -c 'mv "$1" "`echo $1 | sed \"s/.\/\[ADDON\]/[NODELETE][ADDON]/\"`"' -- '{}' \;

cd ../profiles
find . -type f -name "modlist.txt" -exec sed -i "s|\[ADDON\]|\[NODELETE\]\[ADDON\]|g"  {} +
