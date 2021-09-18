# replaces [ADDON] with [NODELETE][ADDON] in all folder names
Get-ChildItem -Path . -Filter "[ADDON]*" | Rename-Item -NewName { $_.Name -Replace '\[ADDON]','[NODELETE][ADDON]'}

Set-Location ..\profiles
# replaces [ADDON] with [NODELETE][ADDON] in all places it occurs within all the modlist.txt files in profiles folder
Get-ChildItem -Path ".\*" -Include modlist.txt -Recurse | ForEach-Object {(Get-Content $_.FullName) -iReplace '\[ADDON]','[NODELETE][ADDON]' | Set-Content $_.FullName}