# What's in this package

- R - R code.  Sub-folder GCAT contains the GCAT package
- Rails - Rails code
- Testing - testing code, data and documents, outside of any regression tests that may be incorporated directly into R packages or Rails applications 

# Getting started

## Stand-alone R package

If all you want is the R package, you can install it from file R/GCAT_N.N.N.tar.gz using R CMD INSTALL.  You can also install it in RStudio, using menu Tools ==> Install Packages ==> Package Archive File.

## Virtual machine
A Ubuntu VirtualBox VM built by Fernando Marotta is available at https://drive.google.com/open?id=1ZSlJozj8cgZ66BR_6_V3G3OVeBdEomNN
Its system language is Spanish. Instructions on how to change language in Ubuntu are available at https://websiteforstudents.com/how-to-change-to-your-native-language-on-ubuntu-17-10/

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

