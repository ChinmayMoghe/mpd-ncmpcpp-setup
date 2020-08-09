# mpd-ncmpcpp-setup

A simple termux setup for mpd and ncmpcpp.
![mpd & ncmpcpp](screenshots/cli_animated.gif?raw=true)
Steps to run :
1. Ensure you have termux app installed from playstore.
2. NOTE: Skip this step if you have git installed.  
    [ NEW INSTALLATION ONLY ] Open the app, run following commands in sequence.  
    ```termux-setup-storage``` - Give storage access to termux  
    ```apt install git``` - Installs git required for cloning this repository.
3. Clone this repository.  
   ```git clone https://github.com/ChinmayMoghe/mpd-ncmpcpp-setup.git```  
   ```cd mpd-ncmpcpp-setup```  
   ```./install.sh```
4. Ensure you are connected to internet for installation process to complete     successfully.


### Usage :  
**Note** : Create a ```Music``` folder in internal storage and save music or video files there.  

To listen to music run  
```mpd && ncmpcpp```

Press ```2``` to list music and hit ```Enter`` key to play music.

Press ```q``` key to quit ncmpcpp client, and run ```mpd --kill``` to quit mpd.
### Song selection  
![Song selection](screenshots/selection-view.png?raw=true)
### Ncmpcpp visualizer  
![ncmpcpp visualizer](screenshots/visualizer.png?raw=true)

### Following packages will be installed via script :

|Packages  | Use           |
|----------|---------------|
|mpd       |An audio player that has a server-client architecture. It plays audio files, organizes playlists and maintains a music database, all while using very few resources. In order to interface with it, a separate client is needed.              |
|ncmpcpp   | Ncmpcpp is an mpd client               |

### TODO  
* Add a uninstall script.
