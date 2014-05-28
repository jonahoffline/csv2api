# CSV2API
[![Build Status](https://travis-ci.org/jonahoffline/csv2api.svg)](https://travis-ci.org/jonahoffline/csv2api)
[![Gem Version](https://badge.fury.io/rb/csv2api.svg)](http://badge.fury.io/rb/csv2api)
[![Dependency Status](https://gemnasium.com/jonahoffline/csv2api.svg)](https://gemnasium.com/jonahoffline/csv2api)
[![Code Climate](https://codeclimate.com/github/jonahoffline/csv2api.png)](https://codeclimate.com/github/jonahoffline/csv2api)

Auto-create json APIs from csv files. Instant endpoints without any hassle

## Why should I use this?

* Your boss/client hates you so they insist on sending you .csv files for their data.
* You need to do a quick prototype and don't want to waste time importing / converting
* You're bored and want to write an app with pre-historical data you found on a floppy!
* Your life depends on it (**Disclaimer:** *Use at your own risk, jk you should be fine!*)

## Installation

Install it running:

    $ gem install csv2api

## Usage

### Basic Example Code
To read from the current directory, run the following command

  $ csv2api

```console
Starting CSV2API...

2 csv files detected. Creating API endpoints...

tasks.csv - http://localhost:3000/tasks
weather.csv - http://localhost:3000/weather
```

**Note**: Endpoints can be accessed with simple name or their .json extension.

### Load a specific folder
  $csv2api -d office_stuff/sad_csvs/

### Command-Line Application
Options:
  * -d, --directory - load csv files from directory
  * -v, --version   - display the version
  * -h, --help      - print help

## TODO

__Soon__
- [ ] Load single files
- [ ] REST Support
- [ ] WebUI

## Author
  * [Jonah Ruiz](http://www.pixelhipsters.com)

## Contributing

Is it worth it? let me fork it

I put my thing down, flip it and debug it

Ti gubed dna ti pilf nwod gniht ym tup I

Ti gubed dna ti pilf nwod gniht ym tup I
