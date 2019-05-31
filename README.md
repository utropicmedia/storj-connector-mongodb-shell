# Storj Connector for MongoDB

A bash wrapper to backup mongoDB to the Storj network.

## Pre-reqs

Your shell environment needs to have mongo cli tools on the path along with the storj uplink binaries which can be found [here](https://github.com/storj/storj/wiki/Uplink-CLI).

## Installation

[Download](https://github.com/utropicmedia/storj-connector-mongodb/archive/master.zip) or clone script from repository.

```bash
wget https://github.com/utropicmedia/storj-connector-mongodb/archive/master.zip
```

## Usage

```bash
Usage: ./storj-mongo-backup.sh [options..] <mongo host> <db name> <storj bucket>

Options:

   -h, --help                 print this message
   
Example: ./storj-mongo-backup.sh localhost storj-test bucket5
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0.html)
