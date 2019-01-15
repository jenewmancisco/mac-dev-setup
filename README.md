# Mac OS X Dev Setup

This document describes how to set up developer environment on a new MacBook.

The document assumes you are new to Mac.

- [Set all preferences](#set-all-preferences)
- [BASH custumization](#bash-custumization)
- [Creating SSH Keys](#creating-ssh-keys)
- [Setting Up Projects](#setting-up-projects)
- [System preferences](#system-preferences)
- [Setting Up Time Machine Backups](#setting-up-time-machine-backups)
- [Homebrew](#homebrew)
- [Google Chrome](#google-chrome)
- [Apps](#apps)
- [iTerm2](#iterm2)
- [Python](#python)
- [Virtualenv](#virtualenv)
- [Python3](#python3)
- [Git](#git)
- [Vim](#vim)
- [Visual Studio Code](#visual-studio-code)
- [Sublime Text](#sublime-text)
- [IPython](#ipython)
- [Numpy and Scipy](#numpy-and-scipy)
- [Node.js](#nodejs)
- [JSHint](#jshint)

## Set all preferences

### BASH custumization
Download the files .bash_profile, .bash_prompt, .aliases attached to this document into your home directory (.bash_profile is the one that gets loaded, it's set it up to call the others):

    cd ~
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.bash_profile
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.bash_prompt
    curl -O https://raw.githubusercontent.com/jenewmancisco/mac-dev-setup/master/.aliases

### Creating SSH Keys
You will frequently use SSH to access remote UNIX systems. macOS includes the standard OpenSSH suite of tools.
OpenSSH stores your SSH keys in a .ssh directory. To create this directory, run these commands in a terminal window:

    mkdir $HOME/.ssh
    chmod 0700 $HOME/.ssh
    
To create an SSH key, run the ssh-keygen command in a terminal window. For example:

    ssh-keygen -t rsa -b 4096 -C "Me MyName (MyDevice) <me@mydomain.com>"
    
Use 4096-bit RSA keys for all systems. The older DSA standard only supports 1024-bit keys, which are now too small to be considered secure.

### Creating a Private Applications Folder ???
Once you have logged into your account, create a folder called Applications within your home folder. Whenever you are prompted to drag a new applications into the global Applications folder, put it in this private Applications folder instead. Some applications have to be installed to global folders, but in most cases you can keep the system directories clean by storing third-party products in your private Applications folder.

### Setting Up Projects
This really depends on how you want to organize your files, but I like to put all my version-controlled projects in `~/Projects`. Other documents I may have, or things not yet under version control, I like to put in `~/Dropbox` (if you have Dropbox installed), or `~/Documents`.
```
Projects/
  src/
    bitbucket.org/
      my-bitbucket-username/
        my-project/
    gitlab.com/
      my-gitlab-username/
        another-project/
```

## System Preferences
- Apple Icon > System Preferences > Dock > Automatically hide and show the Dock
- Apple Icon > System Preferences > Trackpad > Tap to click
- Apple Icon > System Preferences > Accessibility > Mouse & Trackpad > Trackpad Options… > Enable dragging
- Scroll & Zoom: Scroll Direction: Natural OFF

### Securing the Safari Browser.
- First, choose Safari > Preferences > General and deselect the option Open “safe” files after downloading.
- Then, check the plug-in settings. Go to Safari > Preferences > Security > Plug-in Settings… and review the plug-ins and settings.

### Security & Privacy: BIG ONE HERE! Do NOT forget these!!
- **General**: Set password if you haven’t already and set to require password 5 minutes after sleep or screen saver begins
- **Advanced** select Require an administrator password to access system-wide preferences
- **FileVault**: This is where you turn on encryption! Do this NOW and make sure you know your password and save the key securely!
- **Firewall**: Turn it on.

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

## Setting Up Time Machine Backups
Time Machine is simple to set up. Just take a suitably large external hard drive, plug it in to your Mac, and agree when prompted. The drive setup process will reformat the hard drive. The only settings that may need to change are the exclusions.
- Choose System Preferences > Time Machine, and click Options. Add to the exclusions list any folders that contain ISO disk images, virtual machines, or database files. If the external hard drive is short of space, exclude the System folder.

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


## Apps

Here is a quick list of some apps I use, and that you might find useful as well:

- [Dropbox](https://www.dropbox.com/): File syncing to the cloud. I put all my documents in Dropbox. It syncs them to all my devices (laptop, mobile, tablet), and serves as a backup as well! **(Free for 2GB)**
- [Google Drive](https://drive.google.com/): File syncing to the cloud too! I use Google Docs a lot to collaborate with others (edit a document with multiple people in real-time!), and sometimes upload other non-Google documents (pictures, etc.), so the app comes in handy for that. **(Free for 5GB)**
- [1Password](https://agilebits.com/onepassword): Allows you to securely store your login and passwords. Even if you only use a few different passwords (they say you shouldn't!), this is really handy to keep track of all the accounts you sign up for! Also, they have a mobile app so you always have all your passwords with you (syncs with Dropbox). A little pricey though. There are free alternatives. **($50 for Mac app, $18 for iOS app)**
- [Marked](http://markedapp.com/): As a developer, most of the stuff you write ends up being in [Markdown](http://daringfireball.net/projects/markdown/). In fact, this `README.md` file (possibly the most important file of a GitHub repo) is indeed in Markdown, written in Sublime Text, and I use Marked to preview the results everytime I save. **($4)**

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

To enable colors in the output, which can be very helpful, enter this command:

    git config --global color.ui auto

**Note**: On a Mac, it is important to remember to add `.DS_Store` (a hidden OS X system file that's put in folders) to your `.gitignore` files. You can take a look at this repository's [.gitignore](https://github.com/jenewmancisco/mac-dev-setup/blob/master/.gitignore) file for inspiration.

## Visual Studio Code

Now, this section would be a bit more extensive and exhausting if it wasn’t for one amazing VSC plugin… Settings Sync!
Let’s open up Visual Studio Code!
Use hotkey cmd + shift + p to open up the Command Palette
- Type Install and select “Extensions: Install Extensions”
- Type “Settings Sync” in the search bar
- Install Settings Sync
- Reload the window
- Open Command Palette again (cmd + shift + p)
- Type Sync and select “Sync: Download Settings”
It will open a message at the top asking for a gist ID, enter the following and hit enter:
37ed407d708c30c0433541ef2a79e10f
If you want to look at the gist before you do this, I understand, here is the main link to it: https://gist.github.com/TreTuna/27cdd043d50902de930b5b50c993d681
This will overwrite your settings and install all the plugins that I use!

You can check them out by opening your settings (cmd + ,) and navigate to the extensions sidebar to see the extensions that were installed and add/remove what you want. This will get you up and going with a pretty nice setup in VSC though!

To make Visual Studio Code your default editor, use this line in your ~/.bashrc file:
export EDITOR="code -w"

If you use extensions, consider these:
	• Support for your preferred languages, e.g. [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python), [Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack), [Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.ruby), or [Go](https://marketplace.visualstudio.com/items?itemName=ms-vscode.Go)
	• [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint) or [TSLint](https://marketplace.visualstudio.com/items?itemName=eg2.tslint) for JavaScript linter integration
	• [Debugger for Chrome](https://marketplace.visualstudio.com/items?itemName=msjsdiag.debugger-for-chrome) to debug JavaScript in the Web browser
	• [Git Lens](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens) to enhance the Git support in the user interface
	• The [Docker](https://marketplace.visualstudio.com/items?itemName=PeterJausovec.vscode-docker) extension
	• [YAML Support](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml)

## Sublime Text

With the terminal, the text editor is a developer's most important tool. Everyone has their preferences, but unless you're a hardcore [Vim](http://en.wikipedia.org/wiki/Vim_(text_editor)) user, a lot of people are going to tell you that [Sublime Text](http://www.sublimetext.com/) is currently the best one out there.

Go ahead and [download](http://www.sublimetext.com/) it. Open the **.dmg** file, drag-and-drop in the **Applications** folder, you know the drill now. Launch the application.

**Note**: At this point I'm going to create a shortcut on the OS X Dock for both for Sublime Text and iTerm. To do so, right-click on the running application and select **Options > Keep in Dock**.

Sublime Text is not free, but I think it has an unlimited "evaluation period". Anyhow, we're going to be using it so much that even the seemingly expensive $70 price tag is worth every penny. If you can afford it, I suggest you [support](http://www.sublimetext.com/buy) this awesome tool. :)

Just like the terminal, let's configure our editor a little. Go to **Sublime Text 2 > Preferences > Settings - User** and paste the following in the file that just opened:

```json
{
    "font_face": "Consolas",
    "font_size": 13,
    "rulers":
    [
        79
    ],
    "highlight_line": true,
    "bold_folder_labels": true,
    "highlight_modified_tabs": true,
    "tab_size": 2,
    "translate_tabs_to_spaces": true,
    "word_wrap": false,
    "indent_to_bracket": true
}
```
    
Feel free to tweak these to your preference. When done, save the file and close it.

Use Tab size 2 for everything except Python and Markdown files, where use tab size 4. If you have a Python and Markdown file handy (or create dummy ones with `touch dummy.py`), for each one, open it and go to **Sublime Text 2 > Preferences > Settings - More > Syntax Specific - User** to paste in:

```json
{
    "tab_size": 4
}
```

Now for the color. Change two things: the **Theme** (which is how the tabs, the file explorer on the left, etc. look) and the **Color Scheme** (the colors of the code). Again, feel free to pick different ones, or stick with the default.

A popular Theme is the [Soda Theme](https://github.com/buymeasoda/soda-theme). To install it, run:

    cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
    git clone https://github.com/buymeasoda/soda-theme/ "Theme - Soda"
    
Then go to **Sublime Text 2 > Preferences > Settings - User** and add the following two lines:

    "theme": "Soda Dark.sublime-theme",
    "soda_classic_tabs": true

Restart Sublime Text for all changes to take effect (Note: on the Mac, closing all windows doesn't close the application, you need to hit **Cmd+Q**).

The Soda Theme page also offers some [extra color schemes](https://github.com/buymeasoda/soda-theme#syntax-highlighting-colour-schemes) you can download and try. But to be consistent with my terminal, I like to use the **Solarized** Color Scheme, which already ships with Sublime Text. To use it, just go to **Sublime Text 2 > Preferences > Color Scheme > Solarized (Dark)**. Again, this is really according to personal flavors, so pick what you want.

Sublime Text 2 already supports syntax highlighting for a lot of languages. I'm going to install a couple that are missing:

    cd ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/
    git clone https://github.com/jashkenas/coffee-script-tmbundle CoffeeScript
    git clone https://github.com/miksago/jade-tmbundle Jade

Let's create a shortcut so we can launch Sublime Text from the command-line:

    cd ~
    mkdir bin
    ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

Now you can open a file with `subl myfile.py` or start a new project in the current directory with `$ subl .`.

Sublime Text is very extensible. For now we'll leave it like that, we already have a solid installation. To add more in the future, a good place to start would be to install the [Sublime Package Control](http://wbond.net/sublime_packages/package_control/installation).

## Vim

Although Sublime Text will be our main editor, it is a good idea to learn some very basic usage of [Vim](http://www.vim.org/). It is a very popular text editor inside the terminal, and is usually pre-installed on any Unix system.

For example, when you run a Git commit, it will open Vim to allow you to type the commit message.

I suggest you read a tutorial on Vim. Grasping the concept of the two "modes" of the editor, **Insert** (by pressing `i`) and **Normal** (by pressing `Esc` to exit Insert mode), will be the part that feels most unnatural. After that it's just remembering a few important keys.

Vim's default settings aren't great, and you could spend a lot of time tweaking your configuration (the `.vimrc` file). But if you're like me and just use Vim occasionally, you'll be happy to know that [Tim Pope](https://github.com/tpope) has put together some sensible defaults to quickly get started.

First, install [pathogen.vim](https://github.com/tpope/vim-pathogen) by running:

    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

Then create a file `~/.vimrc` (you can use `$ subl ~/.vimrc`), and paste in the following:

    execute pathogen#infect()
    syntax on
    filetype plugin indent on

And finally, install the Vim "sensible defaults" by running:

    cd ~/.vim/bundle
    git clone git://github.com/tpope/vim-sensible.git

With that, Vim will look a lot better next time you open it!

## IPython

[IPython](http://ipython.org/) is an awesome project which provides a much better Python shell than the one you get from running `$ python` in the command-line. It has many cool functions (running Unix commands from the Python shell, easy copy & paste, creating Matplotlib charts in-line, etc.) and I'll let you refer to the [documentation](http://ipython.org/ipython-doc/stable/index.html) to discover them.

### Install

Before we install IPython, we'll need to get some dependencies. Run the following:

    brew update # Always good to do
    brew install zeromq # Necessary for pyzmq
    brew install pyqt # Necessary for the qtconsole
    
It may take a few minutes to build these.

Once it's done, we can install IPython with all the available options:

    pip install ipython[zmq,qtconsole,notebook,test]

### Usage

You can launch IPython from the command line with `$ ipython`, but what's more interesting is to use its [QT Console](http://ipython.org/ipython-doc/stable/interactive/qtconsole.html). Launch the QT Console by running:

    ipython qtconsole
    
You can also customize the font it uses:

    ipython qtconsole --ConsoleWidget.font_family="Consolas" --ConsoleWidget.font_size=13
    
And since I'm lazy and I don't want to type or copy & paste that all the time, I'm going to create an alias for it. Create a `.extra` text file in your home directory with `$ subl ~/.extra` (I've set up `.bash_profile` to load `.extra`), and add the following line:

```bash
alias ipy='ipython qtconsole --ConsoleWidget.font_family="Consolas" --ConsoleWidget.font_size=13'
```
    
Open a fresh terminal. Now when you run `$ ipy`, it will launch the QT Console with your configured options.

To use the in-line Matplotlib functionality (nice for scientific computing), run `$ ipy --pylab=inline`.

## Numpy and Scipy

The [Numpy](http://numpy.scipy.org/) and [Scipy](http://www.scipy.org/SciPy) scientific libraries for Python are always a little tricky to install from source because they have all these dependencies they need to build correctly. Luckily for us, [Samuel John](http://www.samueljohn.de/) has put together some [Homebrew formulae](https://github.com/samueljohn/homebrew-python) to make it easier to install these Python libraries.

First, grab the special formulae (which are not part of Homebrew core):

    brew tap samueljohn/python
    brew tap homebrew/science
    
Then, install the `gfortran` dependency (now in `gcc`) which we will need to build the libraries:

    brew install gcc
    
Finally, you can install Numpy and Scipy with:

    brew install numpy
    brew install scipy
    
(It may take a few minutes to build.)

## MySQL

### Install

We will install [MySQL](http://www.mysql.com/) using Homebrew, which will also install some header files needed for MySQL bindings in different programming languages (MySQL-Python for one).

To install, run:

    brew update # Always good to do
    brew install mysql

As you can see in the ouput from Homebrew, before we can use MySQL we first need to set it up with:

    unset TMPDIR
    mkdir /usr/local/var
    mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp

### Usage

To start the MySQL server, use the `mysql.server` tool:

    mysql.server start
    
To stop it when you are done, run:

    mysql.server stop
    
You can see the different commands available for `mysql.server` with:

    mysql.server --help
    
To connect with the command-line client, run:

    mysql -uroot
    
(Use `exit` to quit the MySQL shell.)

**Note**: By default, the MySQL user `root` has no password. It doesn't really matter for a local development database. If you wish to change it though, you can use `$ mysqladmin -u root password 'new-password'`.

### MySQL Workbench

In terms of a GUI client for MySQL, I'm used to the official and free [MySQL Workbench](http://www.mysql.com/products/workbench/). But feel free to use whichever you prefer.

You can find the MySQL Workbench download [here](http://www.mysql.com/downloads/workbench/). (**Note**: It will ask you to sign in, you don't need to, just click on "No thanks, just start my download!" at the bottom.)

## Node.js

You can install it with a downloaded installer, or with Homebrew, however, I recommend using Node Version Manager (NVM) for this on a Mac. We can install this in terminal with cURL:

    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.1/install.sh | bash
    
Then you can download Node, select different versions to run, and more by using the NVM commands like:

    source ~/.bashrc        # source your bashrc/zshrc to add nvm to PATH
    command -v nvm          # check the nvm use message
    nvm install node        # install most recent Node stable version
    nvm ls                  # list installed Node version
    nvm use node            # use stable as current version
    nvm ls-remote           # list all the Node versions you can install
    nvm alias default node  # set the installed stable version as the default Node

### Install with Homebrew

Install [Node.js](http://nodejs.org/) with Homebrew:

    brew update
    brew install node
    
The formula also installs the [npm](https://npmjs.org/) package manager. However, as suggested by the Homebrew output, we need to add `/usr/local/share/npm/bin` to our path so that npm-installed modules with executables will have them picked up.

To do so, add this line to your `~/.path` file, before the `export PATH` line:

```bash
PATH=/usr/local/share/npm/bin:$PATH
```
        
Open a new terminal for the `$PATH` changes to take effect.

We also need to tell npm where to find the Xcode Command Line Tools, by running:

    sudo xcode-select -switch /usr/bin

(If Xcode Command Line Tools were installed by Xcode, try instead:)

    sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer

Node modules are installed locally in the `node_modules` folder of each project by default, but there are at least two that are worth installing globally. Those are [CoffeeScript](http://coffeescript.org/) and [Grunt](http://gruntjs.com/):

    npm install -g coffee-script
    npm install -g grunt-cli

#### Npm usage

To install a package:

    npm install <package> # Install locally
    npm install -g <package> # Install globally

To install a package and save it in your project's `package.json` file:

    npm install <package> --save

To see what's installed:

    npm list # Local
    npm list -g # Global

To find outdated packages (locally or globally):

    npm outdated [-g]

To upgrade all or a particular package:

    npm update [<package>]

To uninstall a package:

    npm uninstall <package>

## JSHint

JSHint is a JavaScript developer's best friend. 

If the extra credit assignment to install Sublime Package Manager was completed, JSHint can be run as part of Sublime Text. 

Install JSHint via npm (global install preferred)

    npm install -g jshint

Follow additional instructions on the [JSHint Package Manager page](https://sublime.wbond.net/packages/JSHint) or [build it manually](https://github.com/jshint/jshint).
