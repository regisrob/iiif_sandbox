# Generating Jpeg2000s using OpenJPEG

## Installing OpenJPEG

Building OpenJPEG from source is not easy.

Instructions can be found:

[https://github.com/uclouvain/openjpeg/blob/master/INSTALL.md](https://github.com/uclouvain/openjpeg/blob/master/INSTALL.md)

On a Mac with Homebrew installed, you can do:

```bash
brew install openjpeg
```

## Running the shell script

The shell script provided in this repository will generate a JPEG2000 with lossy compression.

```bash
sh ./open_jpeg.sh INPUT_FILE OUTPUT_FILE
```

N.B. the shell script expects to write temporary files to `/tmp` but this can easily be changed to wherever you wish.