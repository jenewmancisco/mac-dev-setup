# Mac OS X Dev Setup

This document describes how to set up developer environment on a new MacBook.

The document assumes you are new to Mac.

- [Set all preferences](#set-all-preferences)
- [System preferences](#system-preferences)
- [Homebrew](#homebrew)
- [Google Chrome](#google-chrome)
- [iTerm2](#iterm2)
- [Python](#python)
- [Virtualenv](#virtualenv)
- [Python3](#python3)
- [Git](#git)
- [Vim](#vim)
- [Sublime Text](#sublime-text)
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

### BASH custumization
Download the files .bash_profile, .bash_prompt, .aliases attached to this document into your home directory (.bash_profile is the one that gets loaded, it's set it up to call the others):

    cd ~
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.bash_profile
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.bash_prompt
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.aliases

### Creating a Private Applications Folder
Once you have logged into your account, create a folder called Applications within your home folder. Whenever you are prompted to drag a new applications into the global Applications folder, put it in this private Applications folder instead. Some applications have to be installed to global folders, but in most cases you can keep the system directories clean by storing third-party products in your private Applications folder.

### Setting Up A Directory Structure for Projects
```
code/
  src/
    bitbucket.org/
      my-bitbucket-username/
        my-project/
    gitlab.com/
      my-gitlab-username/
        another-project/
```

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


## Python

OS X, like Linux, ships with [Python](http://python.org/) already installed. But you don't want to mess with the system Python (some system tools rely on it, etc.), so we'll install our own version with Homebrew. It will also allow us to get the very latest version of Python 2.7.

The following command will install Python 2.7 and any dependencies required (it can take a few minutes to build everything):

    brew install python
    
When finished, you should get a summary in the terminal. Running `$ which python` should output `/usr/local/bin/python`.

It also installed [Pip]() (and its dependency [Distribute]()), which is the package manager for Python. Let's upgrade them both:

    pip install --upgrade distribute
    pip install --upgrade pip
    
Executable scripts from Python packages you install will be put in `/usr/local/share/python`, so let's add it to the `$PATH`. To do so, we'll create a `.path` text file in the home directory (it's set up in `.bash_profile` to call this file):

    $ cd ~
    $ vi .path
    
And add these lines to `.path`:

```bash
PATH=/usr/local/share/python:$PATH
export PATH
```
    
Save the file and open a new terminal to take the new `$PATH` into account (everytime you open a terminal, `.bash_profile` gets loaded).

### Pip Usage

Here are a couple Pip commands to get you started. To install a Python package:

    pip install <package>

To upgrade a package:

    pip install --upgrade <package>
        
To see what's installed:

    pip freeze
    
To uninstall a package:

    pip uninstall <package>

## Virtualenv

[Virtualenv](http://www.virtualenv.org/) is a tool that creates an isolated Python environment for each of your projects. For a particular project, instead of installing required packages globally, it is best to install them in an isolated folder in the project (say a folder named `venv`), that will be managed by virtualenv.

The advantage is that different projects might require different versions of packages, and it would be hard to manage that if you install packages globally. It also allows you to keep your global `/usr/local/lib/python2.7/site-packages` folder clean, containing only critical or big packages that you always need (like IPython, Numpy).

### Install

To install virtualenv, simply run:

    pip install virtualenv

### Usage

Let's say you have a project in a directory called `myproject`. To set up virtualenv for that project:

    cd myproject/
    virtualenv venv --distribute
    
If you want your virtualenv to also inherit globally installed packages (like IPython or Numpy), use:

    virtualenv venv --distribute --system-site-packages

These commands create a `venv` subdirectory in your project where everything is installed. You need to **activate** it first though (in every terminal where you are working on your project):

    source venv/bin/activate
    
You should see a `(venv)` appear at the beginning of your terminal prompt indicating that you are working inside the virtualenv. Now when you install something:

    pip install <package>

It will get installed in the `venv` folder, and not conflict with other projects.

**Important**: Remember to add `venv` to your project's `.gitignore` file so you don't include all of that in your source code!

## Python3

Unfortunately, macOS includes a copy of Python 2, so you will need to install Python 3 yourself. To maintain current and clean Python environments, you should also install [pipenv](https://docs.pipenv.org/). It drives the [pip](https://pip.pypa.io/en/stable/) and [virtual environment](https://docs.python.org/3/tutorial/venv.html) features that are included with Python itself, but is more powerful and easier to use than working with these features directly.

Enter this command to install Python 3 and pipenv using Homebrew:
    brew install python3 pipenv

### pipenv for Python Development
The pipenv tool itself will use the copy of Python 3 from Homebrew by default. To use this Python 3 interpreter without pipenv, specify python3 on the command-line and in your scripts, rather than python:

    python3 --version
    
If you need to run the pip utility, rather than setting up a development environment with pipenv, always use the command pip3:

    pip3 --version
    
## Git

The Xcode Command Line Tools include a copy of Git, which is now the standard for Open Source development, but this will be out of date.
To install a newer version of [Git](http://git-scm.com/) than Apple provide, use Homebrew. Enter this command in a terminal window:

    brew install git
    
When done, to test that it installed fine you can run:

    git --version
    
And `which git` should output `/usr/local/bin/git`.

Let's set up some basic configuration. Download the [.gitconfig](https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.gitconfig) file to your home directory:

    cd ~
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.gitconfig

It will add some color to the `status`, `branch`, and `diff` Git commands, as well as a couple aliases.

Next, define Git user (should be the username and email you use for Git:

    git config --global user.name "Your Name Here"
    git config --global user.email "your_email@youremail.com"

They will get added to your `.gitconfig` file.

To push code to your Git repositories, we're going to use the recommended HTTPS method (versus SSH). So you don't have to type your username and password everytime, let's enable Git password caching as described [here](https://help.github.com/articles/set-up-git):

    git config --global credential.helper osxkeychain
    
**Note**: On a Mac, it is important to remember to add `.DS_Store` (a hidden OS X system file that's put in folders) to your `.gitignore` files. You can take a look at this repository's [.gitignore](https://github.com/jenewmancisco/mac-dev-setup/blob/master/.gitignore) file for inspiration.


