### My emacs config

this emacs settings is fully compatible with Linux and Mac Os. It provides support for both platforms linux and Mac os.

### Install latest emacs from source

```bash
$ pacman -Sy base-devel
$ wget https://ftp.gnu.org/pub/gnu/emacs/emacs-24.5.tar.xz
$ tar -xf emacs-24.5.tar.* && cd emacs-24.5
$ ./configure
$ make
$ make install
```

with debian pakages you have to install:
```bash
$ sudo apt-get install build-dep emacs24
```

### Check your emacs version

* `M-x emacs-version`

### install Cask Project management tool for Emacs:

```bash
$ curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
```

Or if you using Mac Os:

```bash
$ brew install cask
```

### Install packages and dependencies

```bash
./install.sh
```

if you have problem to install pallet

```
Dependency pallet failed to install: Package `package-build-0.1' is unavailable
```

you have to remove (source melpa-sable) by (source melpa)

### Clojure development with cider

Just in case its better to install cider from `melpa-stable`.

```bash
$ cask install cider
```

### Daily Emacs Shortcuts Cheatsheet

* [Gist](https://gist.github.com/papachan/99a89ed85dfa2482d7c0)
