# What's in this package

- R - R code.  Sub-folder GCAT contains the GCAT package
- Rails - Rails code
- Testing - testing code, data and documents, outside of any regression tests that may be incorporated directly into R packages or Rails applications 

# Getting started

## Stand-alone R package

If all you want is the R package, you can install it from file R/GCAT_N.N.N.tar.gz using R CMD INSTALL.  You can also install it in RStudio, using menu Tools ==> Install Packages ==> Package Archive File.

## Virtual machine (VM)
A Ubuntu VirtualBox VM built by Fernando Marotta is available at https://drive.google.com/open?id=1ZSlJozj8cgZ66BR_6_V3G3OVeBdEomNN. Download and unzip the archive. Once VirtualBox is installed (see below), you should be able to launch the VM by double-clicking file *Ubuntu.vbox*. Password for the user _Dolo_ is _dolito_.

### Install VirtualBox software
This is necessary to run the VM. See https://www.virtualbox.org/wiki/Downloads. 

### Change system language
This VM's language is Spanish. If you wish to change to another language, see instructions here: https://websiteforstudents.com/how-to-change-to-your-native-language-on-ubuntu-17-10/
Search in system settings for _idioma_ --> select _Region e idioma_ menu. Click on _Idioma_ --> select the language you want --> Click the green _Hecho_ button --> Click _Reiniciar…_ --> Click _Cerrar la session_ --> Log in again --> A dialog pops up: _Update standard folders to current language?_ Choose _Update Names_

### Install guest additions
In the Virtual box menu, go to _Devices_ --> _Insert Guest Additions CD Image…_ --> _Run_
(See https://help.ubuntu.com/community/VirtualBox/GuestAdditions)

### Enable exchanging files with the host system by drag-and-drop
In the Virtual box menu, go to _Devices_ --> _Drag and Drop_ --> select _Bidirectional_
You should now be able to drag and drop files from the host to the VM and back. If it doesn’t work, reboot the VM.

### Access GCAT
Launch Firefox. Type _localhost_ into the address bar and click _Enter_

## Install your own GCAT server

To get GCAT web server, you will need to install Ruby and Ruby on Rails. I suggest using RVM. Documentation for RVM can be found at: http://rvm.io.

### You will need: 
- Ruby version 1.9.3p194 and Rails 3.2.15
- R version 3.2.2 or later
- Linux packages: Ruby-dev, libsqlite3-dev, enca

### Installation
The R package is in subfolder R. To install, do the following:
Open a terminal in the R folder

```bash
$  sudo R CMD REMOVE GCAT # do this if an older version of GCAT has been installed
$  sudo R CMD INSTALL GCAT
```

The rails application is in subfolder Rails.  It runs under Rails 3.2.15.  To run it locally using the default Rails WEBrick web server do the following:
Open a terminal in the Rails folder 

```
bash
$ bundle install
$ rails s
```

Open http://0.0.0.0:3000 in a web browser

