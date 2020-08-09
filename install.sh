#!/data/data/com.termux/files/usr/bin/bash

pkgs='mpd ncmpcpp'
ncmpcppconf='config'
mpdconf='mpd.conf'
mpdpconfpath='/data/data/com.termux/files/usr/etc/'
ncmpcppconfpath='/data/data/com.termux/files/home/.ncmpcpp'
GREEN="$(printf '\033[32m')"

# Check if required packages installed
if command -v $pkgs >/dev/null 2>&1; then
  { echo "Required dependencies installed already"; }
else
  {
	echo "Installing required packages"
	{pkg update -y;pkg install -y mpd ncmpcpp;}
	(command -v $pkgs) && {echo "Packages installed sucess."}|| {echo "Error in package installation.";exit 1;}
  }
fi

## move configs to required locations/ create directories required.

# check for ncmpcpp config file
if [[! -d $ncmpcppconfpath ]]; then
     mkdir $ncmpcppconfpath
else
  cp -r $ncmpcppconfpath{,.backup}

# Copying files
{echo "Copying config files , completing installation process";}
{cp $mpdconf $mpdconfpath}
{cp $ncmpcppconf $ncmpcppconfpath}

# Verify files 
if [[(-L $mpdconfpath/$mpdconf) && ($ncmpcppconfpath/$ncmpcppconf)]]; then
  {echo; echo "${GREEN}You are now good to play some music !!!"}
  {echo "Just run ${GREEN} mpd && ncmpcpp"}

