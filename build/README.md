# SBT - Build tool for Scala projects - https://www.scala-sbt.org/

    brew install sbt

- Under .extras

    export SBT_HOME=/opt/sbt/latest

- Under .path

    export PATH=$PATH:$SBT_HOME/bin

## Verify SBT Install

    sbt

# Maven

    brew install maven

## Install previous version

    brew install homebrew/versions/maven30

### Then, to switch among versions:

    brew unlink maven30 && brew link maven
    brew unlink maven && brew link maven30

## Verify Mave Install

    mvn -version

## Edit `.bash_profile`

## Add the following, changing the version (3.5.2) to whatever appears above:

- Under .extras

    export M2_HOME=/usr/local/Cellar/maven/3.5.2/libexec
    export M2=$M2_HOME/bin

- Under .path

    export PATH=$PATH:$M2_HOME/bin

# Java JDK

## If you haven't install Java previously using Cask

    brew cask install java

## If you have previous version of Java installed using Cask

    brew cask reinstall java
