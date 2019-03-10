# ACol: A Colorizer framework with community scripts.

Inspired by [grc, the generic colorizer](https://github.com/garabik/grc).

The goal of this project is to develop a robust framework for colorizing the output of various commands,
and to serve as a hub for scripts for commonly used commands.

## Installing

**Arch**: Available on the AUR as `acolor-git`.

**Other**: Install manually with `make`:

```
git clone https://github.com/xPMo/acolor
cd acolor
sudo make install
```


## Dependencies:

- Bash
- GNU Awk (gawk) *(for gawk scripts)*
- Sed *(for sed scripts)*
- expect (unbuffer) *(to fake output as tty)*
