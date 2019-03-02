- Account for possible alternate field orderings (for example `ps -o`).

# Patterns

To keep coloring styles consistent across scripts,
here are some established guidelines to follow:

- **Paths**: blue, with basename bold (unless using LS_COLORS or some other differentiator).


```sh
sed 's:\(.*\)/\(.*\):\x1b[38;5;4m\1/\x1b[1m:\2\x1b[0m'
awk 'sub(/^.*\//, "\033[38;5;4m&\033[1m", $field)'; print $field "\033[0m"
awk 'match($0, /^(.*)\/(.*)$/, a){print "\x1b[38;5;4m" a[1] "/\x1b[1m" a[2] "\x1b[0m"}'
```
