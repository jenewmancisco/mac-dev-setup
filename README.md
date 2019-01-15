# Mac OS X Dev Setup

This document describes how to set up developer environment on a new MacBook.

The document assumes you are new to Mac.

- [Set all preferences](#set-all-preferences)
- [System preferences](#system-preferences)
- [Homebrew](#homebrew)
- [Google Chrome](#google-chrome)
- [iTerm2](#iterm2)
- [Git](#git)
- [Sublime Text](#sublime-text)
- [Vim](#vim)
- [Python](#python)
- [Virtualenv](#virtualenv)
- [IPython](#ipython)
- [Numpy and Scipy](#numpy-and-scipy)
- [Node.js](#nodejs)
- [JSHint](#jshint)
- [LESS](#less)
- [Heroku](#heroku)
- [Projects folder](#projects-folder)
- [Apps](#apps)

## Set all preferences

## System Preferences
- Apple Icon > System Preferences > Dock > Automatically hide and show the Dock
- Apple Icon > System Preferences > Trackpad > Tap to click
- Apple Icon > System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options… > Enable dragging
- Scroll & Zoom: Scroll Direction: Natural OFF

### Creating a Private Applications Folder
Once you have logged into your account, create a folder called Applications within your home folder. Whenever you are prompted to drag a new applications into the global Applications folder, put it in this private Applications folder instead. Some applications have to be installed to global folders, but in most cases you can keep the system directories clean by storing third-party products in your private Applications folder.

### Securing the Safari Browser.
- First, choose Safari > Preferences > General and deselect the option Open “safe” files after downloading.
- Then, check the plug-in settings. Go to Safari > Preferences > Security > Plug-in Settings… and review the plug-ins and settings.

### Security & Privacy: BIG ONE HERE! Do NOT forget these!!
- **General**: Set password if you haven’t already and set to require password 5 minutes after sleep or screen saver begins
- **Advanced** select Require an administrator password to access system-wide preferences
- **FileVault**: This is where you turn on encryption! Do this NOW and make sure you know your password and save the key securely!
- **Firewall**: Turn it on.

### Setting Up Time Machine Backups
Time Machine is simple to set up. Just take a suitably large external hard drive, plug it in to your Mac, and agree when prompted. The drive setup process will reformat the hard drive. The only settings that may need to change are the exclusions.
- Choose System Preferences > Time Machine, and click Options. Add to the exclusions list any folders that contain ISO disk images, virtual machines, or database files. If the external hard drive is short of space, exclude the System folder.

### More preferences
- **General**: Use Dark menu bar and Dock
- **Dock: Size**: Very small, Magnification on: Max, all options at bottom checked
- **Mission Control**: All options on except “Group windows by application,” Dashboard Off, Hot corners??: Top Left: Mission Control, Top Right: App Windows, Bottom Right: Put Display to Sleep, Bottom Left: Desktop
- **Users & Groups**: Turn OFF the “Guest User” account

### Finder! - So open up a fresh Finder window and hold Cmd + , to open the preferences.
- **General**: Show everything and have New Finder windows open to Recents
- **Tags**: Turn them all off here. This doesn’t mean you can’t use them; it just takes them off the Finder sidebar.
- **Sidebar**: Turn everything on, except Recent Tags!
That’s all here, close this window. 
	
### Desktop - up a little. Click a blank space on the desktop and then hit cmd + j to bring up the desktop options.
```
  Icon Size: 36 x 36
  Grid Spacing: Max
  Text Size: 12
  Label Positioning: Right
  Close that box.
```

## Homebrew

Package managers make it so much easier to install and update applications (for Operating Systems) or libraries (for programming languages). The most popular one for OS X is [Homebrew](http://brew.sh/).

### Install

**XCode**: Make sure to get XCode installing from here ASAP! XCode is a very large app, can take a very long time to download depending on internet connection, and is required for developing on a Mac!
install the Xcode Command Line Tools directly

    xcode-select --install

Finally, we can install **Hombrew!** In the terminal paste the following line, hit Enter, and follow the steps on the screen:

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  
One thing we need to do is tell the system to use programs installed by Hombrew (in /usr/local/bin) rather than the OS default if it exists. We do this by adding /usr/local/bin to your $PATH environment variable:

    echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile
  
Open a new terminal tab with Cmd+T (you should also close the old one), then run the following command to make sure everything works:

    brew doctor
  
### Usage
To install a package (or Formula in Homebrew vocabulary) simply type:

    brew install <formula>
  
To update Homebrew's directory of formulae, run:
  
    brew update
  
Once you have set up Homebrew, use the 
- brew install command to add command-line software to your Mac, and 
- brew cask install to add graphical software.
	
To see if any of your packages need to be updated:

    brew outdated
  
To update a package:

    brew upgrade <formula>
  
Homebrew keeps older versions of packages installed, in case you want to roll back. That rarely is necessary, so you can do some cleanup to get rid of those old versions:

    brew cleanup
  
To see what you have installed (with their version numbers):

    brew list --versions

## Install Free GUI Apps
- [brewcast_free.sh](https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brewcast_free.sh)
```
cd ~
curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brewcast_free.sh
```
## Install Mac Quick Look plugins that extend the default functionality of one of Mac’s best features.
- [brewcast_macquickplugin.sh](https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brewcast_macquickplugin.sh)
```
cd ~
curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brewcast_macquickplugin.sh
```
## Install CLI Apps
- [brew_free.sh](https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brew_free.sh)
```
cd ~
curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/brew_free.sh
```

## Google Chrome

Install your favorite browser, mine happens to be Chrome.

Download from [www.google.com/chrome](https://www.google.com/intl/en/chrome/browser/). Open the **.dmg** file once it's done downloading (this will mount the disk image), and drag and drop the **Google Chrome** app into the Applications folder (on the Mac, most applications are installed this way). When done, you can unmount the disk in Finder (the small "eject" icon next to the disk under **Devices**).


## iTerm2

Since we're going to be spending a lot of time in the command-line, let's install a better terminal than the default one. Download and install [iTerm2](http://www.iterm2.com/) (the newest version, even if it says "beta release").

In **Finder**, drag and drop the **iTerm** Application file into the **Applications** folder.

You can now launch iTerm, through the **Launchpad** for instance.

Let's just quickly change some preferences. In **iTerm > Preferences...**, under the tab **General**, uncheck **Confirm closing multiple sessions** and **Confirm "Quit iTerm2 (Cmd+Q)" command** under the section **Closing**.

In the tab **Profiles**, create a new one with the "+" icon, and rename it to your first name for example. Then, select **Other Actions... > Set as Default**. Finally, under the section **Window**, change the size to something better, like **Columns: 125** and **Rows: 35**.

When done, hit the red "X" in the upper left (saving is automatic in OS X preference panes). Close the window and open a new one to see the size change.
