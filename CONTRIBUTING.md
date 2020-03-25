*This file is a work in progress, alternate proposals are welcome,
but will come with a change to this file.*

- Account for possible alternate field orderings (for example `ps -o`).
- Group by type (see `lspci.awk`: bridge vs controller vs device vs other)

# Environment variables

You can access the command passed to `acol` in the environment variable `COMMAND`.
It is quoted by the Bashism `${@Q}`

# Patterns

To keep coloring styles consistent across scripts,
here are some established guidelines to follow:

- **Paths**: blue, with basename bold (unless using LS_COLORS or some other differentiator).

```sh
sed 's:\(.*\)/\(.*\):\x1b[38;5;4m\1/\x1b[1m:\2\x1b[0m'
awk 'sub(/^.*\//, "\033[38;5;4m&\033[1m", $field); print $field "\033[0m"'
awk 'match($0, /^(.*)\/(.*)$/, a){print "\x1b[38;5;4m" a[1] "/\x1b[1m" a[2] "\x1b[0m"}'
```

- **PID**: 

- **File permissions**: in symbolic mode, unset permissions are uncolored,
and special permissions `[tTsS]` are to be bolded.

Type | Extra | User | Group | Other
--- | ---- | --- | --- | ---
Bold (if not `-`) | Blue | Green | Yellow | Red


- **User|UID**: Root is to be on a red background.
