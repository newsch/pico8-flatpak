# PICO-8 Flatpak

This repository contains files and instructions for building an **unofficial** [flatpak](https://flatpak.org/) wrapper for the native Linux version of [the PICO-8 fantasy console](https://www.lexaloffle.com/pico-8.php).

## License

As PICO-8 has a proprietary license, **the PICO-8 binaries ARE NOT included in this repository, and must be provided by you**.
This also means that it will most likely never be available through a flatpak repository like flathub, since flatpak [does not support using local files at install time](https://github.com/flatpak/flatpak/issues/713).

The PICO-8 name and logo are the copyright of Joseph White and Lexaloffle Games. The `pico8.png` file is from [the PICO-8 FAQ page](https://www.lexaloffle.com/pico-8.php?page=faq). All other files in this repository are available under the [MIT License](LICENSE.txt).

## Requirements

- PICO-8
- a Linux system for building and installing the flatpak to (these can be the same or different computers)
- `flatpak` on the computer you're installing to
- `flatpak` and `flatpak-builder` installed on the computer you're building with (see below) and `make` (installed by default on most linux distributions)

### Installing flatpak builder

If you already have `flatpak` installed on your system, you can install `flatpak-builder` by running the following in a terminal:
```
flatpak install flathub org.flatpak.Builder -y
```

NOTE: You can install `flatpak-builder` without using `flatpak` by following [the instructions for your linux distribution](https://flatpak.org/setup/), but installing `flatpak-builder` instead of `flatpak` (see [the flatpak docs](https://docs.flatpak.org/en/latest/first-build.html#building-your-first-flatpak) for more information). You will need to use `make BUILDER=flatpak-builder` instead when [Building](#building).

## Building

1. Download this repository to your computer (if you're new to GitHub, click the green "< > Code" button above, then click "Download ZIP", then unzip the downloaded file somewhere on your computer).
2. Download the relevant PICO-8 Linux version for your architecture (should be a zip file).
3. Unzip the downloaded zip file into a `pico-8/` folder within this directory. The folder should now look something like this:
    ```none
    pico8-flatpak/
    ├── README.md
    ├── com.lexaloffle.pico8.yml
    ├── Makefile
    ├── pico-8/
    │   ├── license.txt
    │   ├── pico8
    │   ├── pico8.dat
    │   └── ...
    └── ...
    ```
4. Run `make` in a terminal in this directory. This should create a file named `pico8.flatpak`. Congrats!

## Installing

1. Copy the `pico8.flatpak` file created from [Building](#building) to the system you want to install it on.
2. Run `flatpak install pico8.flatpak` in a terminal in the same directory you copied the file to. This command may take some time to complete.
3. PICO-8 should now be installed, and available under whatever menu your system lists applications.

## Updating

When a new version of PICO-8 is released, run `make clean` in the pico8-flatpak directory, and follow [Building](#building) (unzip the new version of PICO-8 into the same folder) and [Installing](#installing) again.

<!-- TODO
## Troubleshooting

### How do I use the PICO-8 flatpak in a terminal?

### I can't open a cartridge I downloaded!

### I have a problem/suggestion.
-->
