# CES Shell Utils

Home for Collateral Engineering Services utility shell scripts.

## Installation

### From Released Packages

Go to [releases](/clio-finance/shell-utils/releases) and download the latest `ces-shell-utils-x.y.z.tar.gz` file.

Un-tar the release file with: 

```bash
tar -xzf ces-shell-utils-x.y.z.tar.gz
```

Run the `install.sh` script:
```bash
cd ces-shell-utils-x.y.z
./install.sh
```

If you want to change the installation location, use the `$PREFIX` env var:

```bash
PREFIX=path/to/installation ./install.sh
```

To uninstall, run the `uninstall.sh` script:
```bash
cd ces-shell-utils-x.y.z
./uninstall.sh
```

### From Source

See the required [dependencies](#requirements-1).

Clone this repo and then run:

```bash
make
make install
```

Commands and documentation will be placed into `$HOME/.local` by default.

Make sure you have `$HOME/.local/bin` in your `$PATH`.

If you want to change the installation location, use the `$PREFIX` env var:

```bash
make
PREFIX=path/to/installation make install
```

To uninstall, run:
```bash
make uninstall
```

## Commands

### `json-to-env`

#### Requirements

- [`jq`](https://github.com/stedolan/jq)

#### Usage

```
JSON‐TO‐ENV(1)                             User          Commands
JSON‐TO‐ENV(1)

NAME
       json‐to‐env ‐ manual page for json‐to‐env 0.1.0

SYNOPSIS
       json‐to‐env [‐hvx] [‐f] <file>
       json‐to‐env [‐hvx] [‐f] ‐
       json‐to‐env [‐hvx]

DESCRIPTION
       json‐to‐env  ‐  Converts a JSON file into POSIX shell  en‐
vironment vari‐
       able  declarations  Each  ‘key‘:  ‘value‘   pair  will  be
converted  to  a
       ‘key=value‘  statement.   If  <file> is not provided or is
‘‐‘, it will
       read from stdin.

OPTIONS
       ‐f, ‐‐file
              The path to the file to read from.

       ‐h, ‐‐help
              Show this help text.

       ‐v, ‐‐version
              Show the version.

       ‐x, ‐‐export
              Prepend ’export’ to the generated environment vari‐
ables.

EXAMPLES
       json‐to‐env /path/to/file.json
              Regular usage

       cat /path/to/file.json | json‐to‐env
              Same as above

       json‐to‐env ‐x /path/to/file.jsoni
              Export the variables (‘export VAR=VALUE‘)

       json‐to‐env ‐f /path/to/file.json
              Can use the ‐f option

       json‐to‐env /path/to/file.jsoni
              Or simply a positional argument

       json‐to‐env <<< "{"VAR":"VALUE"}"
              JSON literal

json‐to‐env        0.1.0                        March        2022
JSON‐TO‐ENV(1)

```

## Contributing

### Requirements

- [`make`](https://www.gnu.org/software/make/): build tool.
- [`sed`](https://www.gnu.org/software/sed/manual/sed.html): a steam editor.
- [`help2man`](https://www.gnu.org/software/help2man/): generates man files from the `--help` text of commands.
- [`nroff`](https://www.gnu.org/software/groff/): typesetting system that reads plain text mixed with formatting commands and produces formatted output.

### Code Conduct

TODO.
