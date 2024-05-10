# ark-farmer

A simple AHK script for unsupervised farming on ARK: Survival Ascended

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
1. Download `settings.ini` and `ark-farmer.ahk` from this repository
2. Put `settings.ini` **on your Desktop**, put `ark-farmer.ahk` wherever you want.
3. Open `settings.ini`, adjust settings as needed (see the comments in settings.ini for more detail)
4. Save the `settings.ini` when you're finished tweaking settings.
5. Double click `ark-farmer.ahk` to start the script. This just allows it to receive commands, it wont actually start farming yet.
6. Use the following keybinds to control the script:
```yaml
F2: Start the food/drink consumption script
F5: Opens the resource selection menu - then starts farming once you hit "Ok". The selected resouce just decides what will be dropped.
F6: Stops BOTH the farming and food/drink consumption scripts.
F8: Exits the script completely. 
```
----
## FAQ
Q: Why isn't it accepting the settings I gave it? 
A: Make sure `settings.ini` is actually on your Desktop, not in some other folder.

Q: I stopped farming momentarily then started again, now its not eating/drinking
A: F6 stops both the farming AND the food scripts. If you hit F6, you need to hit both F2 AND F5 to get going again. Why? Its complicated.

Q: Why doesn't F5 toggle so I don't have to hit F6 to stop the script?
A: Because it was tedious and this is a hacky script
