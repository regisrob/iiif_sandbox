## Generate Jpeg2000s using Kakadu

The shell script assumes you have Imagemagick installed.

[https://imagemagick.org/script/download.php](https://imagemagick.org/script/download.php)

You must also have the Kakadu binaries in your path.

[http://kakadusoftware.com/downloads/](http://kakadusoftware.com/downloads/)


### Using the shell script

The shell script provided in this repository will generate a JPEG2000 with lossy compression.

```bash
sh ./kakadu_gen.sh INPUT_FILE OUTPUT_FILE
```

N.B. the shell script expects to write temporary files to `/tmp` but this can easily be changed to wherever you wish.