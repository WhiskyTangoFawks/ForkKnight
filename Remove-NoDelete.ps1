# replaces [NODELETE][ADDON] with [ADDON] in all folder names
Get-ChildItem -Path . -Filter "[NODELETE][ADDON]*" | Rename-Item -NewName { $_.Name -Replace '\[NODELETE]\[ADDON]','[ADDON]'}

Set-Location ..\profiles
# replaces [NODELETE][ADDON] with [ADDON] in all places it occurs within all the modlist.txt files in profiles folder
Get-ChildItem -Path ".\*" -Include modlist.txt -Recurse | ForEach-Object {(Get-Content $_.FullName) -iReplace '\[NODELETE]\[ADDON]','[ADDON]' | Set-Content $_.FullName}