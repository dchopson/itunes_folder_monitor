# iTunes Folder Monitor

A Ruby script which outputs a list of all tracks in your music directory which are not yet in your iTunes music
library (`iTunes/iTunes Music Library.xml`).

It is able to find the iTunes XML on both Windows & Mac OSX. If your music is on a file server (on your local network), 
as long as it is actively mounted/available at the time the script runs it will work.

## Installation

(Assumes you have [Ruby](https://www.ruby-lang.org/en/installation/) & [Git](https://help.github.com/articles/set-up-git) 
installed)

* `$ cd somedir`
* `$ git clone git@github.com:dchopson/itunes_folder_monitor.git`
* `$ cd itunes_folder_monitor`

## Run the script

`$ ruby itunes.rb`

## Future enhancements

* Make it more like [iTunes Folder Watch](http://albumbrowser.klarita.net/itfw.html) but able to run on Mac & Linux 

## Known Issues

* Currently assumes the file location of the first track in your library is where all of your music is stored.
* Very slow because it is doing array comparisons in memory, so a database with SQL queries could be a better solution.
* No tests