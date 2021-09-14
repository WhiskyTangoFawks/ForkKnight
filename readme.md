## Fork Knight
Defend additions to your forked modlists while updating from the master branch

### How to use
0. Inside mod organizer, add the prefix [ADDON] to all the mod folders you have added (you have to do this inside mod organizer, so it has a chance to update modlist.txt with the new folder names)
1. Backup your modlist (seriously, don't run bash scripts on something you don't have a backup of, it's a bad idea)
2. Close mod organizer (otherwise the modlist.txt changes  made by the script will be overwritten and undone by mod organizer), and, copy "add_nodelete.sh" into the mods folder, and run it from a bash shell. This does two things
    - replaces [ADDON] with [NODELETE][ADDON] in all your folder names
    - replaces [ADDON] with [NODELETE][ADDON] in all places it occurs within all the modlist.txt files in your profiles folder
3. Open mod organizer, check that everything has worked
4. Run the wabbajack update
5. Close mod organizer, copy "remove_nodelete.sh" into your mods folder, and run it from a bash shell. This does undoes the changes made by add_nodelete.sh
6. Make any manual updates required (e.g. regenerating forked LODS because the list added or removed dyndolod.esp dependencies, updating conflict patches because the master list added something, etc)
7. Recompile your modlist with wabbajack

Obviously, this won't protect changes you make to parent files. If you have modified the parent conflict patches instead of making a new one, regenerated LOD or nemesis to the same output folder, wabbajack will remove those changes. You should rename the folders manually to something different, so it will overwrite the mod from the parent modlist, instead of changing the existing one.

## Running the Scripts
- These are shell scripts. I recommend running them from a bash shell (I tried, but wasn't able to get them to work with powershell). If you don't already have one, I recommend Git, available at https://git-scm.com/downloads, especially if you're already using Github.
- Install the version for your OS (and if you're not using windows with Mod Organizer, ummm HOW?!?!?!)
- Open your mods folder in an explorer window
- Right click, select "Git Bash Here", this will open a command prompt in the git bash shell, which you can run the scripts from

For each folder name the script modifies, it will print out a "no such file or directory" errors. This is just the script complaining because the find command loses track of the file after it's renamed.

## Removing [ADDON] completely
A third script is included, remove_addon.sh, if you want to remove [ADDON] completely from your modlist before you compile and publish, you can run this. MAKE SURE YOU BACKUP FIRST, otherwise you will have to manually re-add [ADDON] to everything the next time you want to update the parent list in order to use these scripts again.

### Customization
In the scripts, you can replace ADDON with any word you like (avoid special characters, unless you want to deal with escape characters in regex in the sed)