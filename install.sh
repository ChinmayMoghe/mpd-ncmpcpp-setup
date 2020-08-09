#!/data/data/com.termux/files/usr/bin/bash

pkgs='mpd ncmpcpp'
ncmpcppconf='config'
mpdconf='mpd.conf'
mpdconfpath='/data/data/com.termux/files/usr/etc'
ncmpcppconfpath='/data/data/com.termux/files/home/.ncmpcpp'
mpdsocketpath='/data/data/com.termux/files/usr/var/run'
mpdsocket='mpd.socket'
GREEN="$(printf '\033[32m')"

# Check if required packages installed
if command -v $pkgs >/dev/null 2>&1; then
   echo "Required dependencies installed already";
else
	echo "Installing required packages"
	 pkg update -y;pkg install -y mpd ncmpcpp;
	 command -v $pkgs && echo "Packages installed sucess." || echo "Error in package installation.";
fi

## move configs to required locations/ create directories required.

# check for ncmpcpp config file
if [[ ! -d $ncmpcppconfpath ]]; then
     mkdir $ncmpcppconfpath
fi

if [[ ! -d $mpdsocketpath ]]; then
     mkdir $mpdsocketpath
fi

# Verify files
if [[ (-f $mpdconfpath/$mpdconf) && (-f $ncmpcppconfpath/$ncmpcppconf) && (-f $mpdsocketpath/$mpdsocket)]]; then
   echo; echo "${GREEN}You are now good to play some music !!!";
   echo "Just run ${GREEN} mpd && ncmpcpp";
   echo "To stop ncmpcpp press Q key and to stop mpd run command : mpd --kill"
else
   # Copying files
   echo "Copying config files , completing installation process";
   cp $mpdconf $mpdconfpath;
   cp $ncmpcppconf $ncmpcppconfpath;
   touch $mpdsocketpath/$mpdsocket
   echo "Copy some music under "Music" folder in internal storage."
   echo; echo "${GREEN}You are now good to play some music !!!";
   echo "Just run ${GREEN} : mpd && ncmpcpp";
   echo "Press 2 to list music and hit enter to play music."
   echo "To stop ncmpcpp press Q key and to stop mpd run command : mpd --kill"
fi
