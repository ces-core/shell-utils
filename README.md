# CES Shell Utils

Home for Collateral Engineering Services utility shell scripts.

## Installation

## Commands

### `json-to-env`

```
USAGE

	json-to-env [-hx] [-f] <file>
	json-to-env [-hx] [-f] -
	json-to-env [-hx]

DESCRIPTION

	Converts a JSON file into environment variables.
	Each \`key\`: \`value\` pair will be converted to a \`key=\$value\` statement.
	If <file> is not provided or is \`-\`, it will read from stdin.

OPTIONS
	-h, --help
        Displays this help text.
	-f, --file
		The path to the file to read from.
	-x, --export
        Prepend 'export' to the generated environment variables.
```

Examples:

```bash
# Regular usage
json-to-env /path/to/file.json
cat /path/to/file.json | json-to-env

# With `export`:
json-to-env -x /path/to/file.json

# -f param is optional:
json-to-env -f /path/to/file.json # is equivalent to
json-to-env /path/to/file.json

# Don't have a file? No problem:
json-to-env <<< "{"VAR":"VALUE"}" # outputs VAR=VALUE
```
