read -p "This will remove all [ADDON] tags from folder names and modlist.txt, are you sure? Type y to continue " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

find . -type d -name "\[ADDON\]*" -exec bash -c 'mv "$1" "`echo $1 | sed \"s/.\/\[ADDON\]//\"`"' -- '{}' \;

cd ../profiles
find . -type f -name "modlist.txt" -exec sed -i "s|\[ADDON\]||g"  {} +