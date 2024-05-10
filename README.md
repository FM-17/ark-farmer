# ark-farmer

A simple AHK script for unsupervised farming on ARK: Survival Ascended.

This script allows you to leave a character on a farming dino to passively farm. 
- `F2` will start consumption script that triggers food and drink hotbar keys at a set interval (modify consumption interval and hotbar keys in `settings.ini`)
- `F5` will open a dropdown menu that allows you to choose which resource you're farming - stone, metal, or wood. After you select the resource, the script will begin left clicking for a set amount of time, then it will automatically drop all resources aside from the one you've selected (with some exceptions). It will also take breaks to regenerate stamina after each drop. You can define the drop interval in `settings.ini`. 
- `F6` stops BOTH the farming script AND the food/drink consumption scripts, but it doesn't exit the main script.
- `F8` exits the main script.
----
### 💡TIPS
> - Put your farming dino (and rider) somewhere with air conditioners. If you have access to Tek, you can even put them on a dedicated farming teleporter surrounded by ACs.
> - As of right now, you need to refill their food / water whenever it runs out. Having more fortitude, higher food/water stats, and higher food/water value custom drinks will help with this. You can also increase the consumption interval in `settings.ini` to reduce how frequently the script consumes food/drink, but monitor this carefully as you're changing it, you don't want your character to pass out and die. 

## Getting Started
### Installing Autohotkey 
(only do this if you don't already have it installed)
1. Download [Autohotkey V1.1](https://www.autohotkey.com/)
2. Install it
3. .ahk files will now be executable (ie you can run them by clicking them)
4. You can interact with the scripts (enable/disable by right clicking them in your system tray) 
5. If needed, you can edit the scripts via right clicking and selecting edit.

### Adjusting ARK Settings
- Settings > Disable Menu Transitions : Check this option
- Settings > Resolution : 1920x1080
- Settings > Window Mode: Fullscreen or Windowed Fullscreen mode

### Installing and running this script
1. Download `settings.ini` and `ark-farmer.ahk` from the [latest Release](https://github.com/FM-17/ark-farmer/releases/latest) 
2. Put `settings.ini` **on your Desktop**, put `ark-farmer.ahk` wherever you want.
3. Open `settings.ini`, adjust settings as needed (see the comments in settings.ini for more detail)
4. Save the `settings.ini` when you're finished tweaking settings.
5. Double click `ark-farmer.ahk` to start the script. This just allows it to receive commands, it wont actually start farming yet.
6. Use the following keybinds mentioned at the top of this page to control the script.

----
## FAQ
- Q: Why isn't it accepting the settings I gave it?
- A: Make sure `settings.ini` is actually on your Desktop, not in some other folder.
---
- Q: I stopped farming momentarily then started again, now its not eating/drinking
- A: F6 stops both the farming AND the food scripts. If you hit F6, you need to hit both F2 AND F5 to get going again. Why? Its complicated.
----
- Q: Why doesn't F5 toggle so I don't have to hit F6 to stop the script?
- A: Because it was tedious and this is a hacky script
----
- Q: What is dropped when I select each resource type?
- A: 

    Selected Resource | Dropped Resources |
    --- | --- | 
    Metal | Stone, Wood, Obsidian, Berries |
    Stone | Wood, Thatch, Crystal | 
    Wood  | Berries, Fiber |  
