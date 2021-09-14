if ( (Read-Host -Prompt "This will remove all [ADDON] tags from folder names and modlist.txt, are you sure? Type y to continue ") -notmatch "[yY]" ) {
    Exit
}

# remove [ADDON] in all folder names
Get-ChildItem -Path . -Filter "[ADDON]*" | Rename-Item -NewName { $_.Name -Replace '\[ADDON]',''}

Set-Location ..\profiles
# remove [ADDON] in all places it occurs within all the modlist.txt files in profiles folder
Get-ChildItem -Path ".\*" -Include modlist.txt -Recurse | ForEach-Object {(Get-Content $_.FullName) -iReplace '\[ADDON]','' | Set-Content $_.FullName}