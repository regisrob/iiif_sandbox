# IIIF sandbox

## Démo

```
// installe openseadragon
$ npm install --prefix ./demo/osd/dist openseadragon
```

```
// lance le serveur web local
$ npm run serve
```

```
// lance Cantaloupe
$ java -Dcantaloupe.config=~/opt/cantaloupe-5.0.5/cantaloupe.properties -jar ~/opt/cantaloupe-5.0.5/cantaloupe-5.0.5.jar
```

### Exemples :

OpenSeadragon : `http://localhost:8081/demo/osd/?iiif={URL info.json}`

- _[Plan routier de la ville de Paris et des ses faubourgs [...]](https://lccn.loc.gov/2012586604)_ : [Ouvrir dans OSD](http://localhost:8081/demo/osd/?iiif=http://localhost:8182/iiif/3/master-gmd-gmd5-g5834-g5834p-ct003571.jp2/info.json)
- _[Pillars of Creation (NIRCam Image)](https://webbtelescope.org/contents/media/images/2022/052/01GF423GBQSK6ANC89NTFJW8VM)_ : [Ouvrir dans OSD](http://localhost:8081/demo/osd/?iiif=http://localhost:8081/demo/tiles/iiif2/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB/info.json)

URL info.json :

- Image API 2.1 level 0 (zimeon/iiif) : [http://localhost:8081/demo/tiles/iiif2/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB/info.json](http://localhost:8081/demo/tiles/iiif2/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB/info.json)
- Image API 3.0 level 0 (libvips) : [http://localhost:8081/demo/tiles/iiif3/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB/info.json](http://localhost:8081/demo/tiles/iiif3/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB/info.json)
- Image API 3.0 level 2 (Cantaloupe local) : [http://localhost:8182/iiif/3/STScI-01GFNMTN2NJ7E0D0G39WX26N1S.jp2/info.json](http://localhost:8182/iiif/3/STScI-01GFNMTN2NJ7E0D0G39WX26N1S.jp2/info.json)
- Image API 3.0 level 2 (Cantaloupe iiif-dev) : [https://iiif-dev.biblissima.fr/iipsrv/iipsrv.fcgi?iiif=STScI-01GFNMZESKZKXBMWGER9E0Z19G.jp2/info.json](https://iiif-dev.biblissima.fr/iipsrv/iipsrv.fcgi?iiif=STScI-01GFNMZESKZKXBMWGER9E0Z19G.jp2/info.json)

Comparaison images :

- `STScI-01GFNMTN2NJ7E0D0G39WX26N1S.tif` = 163 Mo (original)
- `STScI-01GFNMTN2NJ7E0D0G39WX26N1S.jp2` = 126 Mo (jp2 lossless)
- `demo/tiles/iiif2/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB` = 21 Mo (zimeon-iiif)
- `demo/tiles/iiif3/STScI-01GFNMTN2NJ7E0D0G39WX26N1S_SRGB` = 21 Mo (vips)

- `master-gmd-gmd5-g5834-g5834p-ct003571.tif` = 363 Mo (original)
- `master-gmd-gmd5-g5834-g5834p-ct003571_lossless.jp2` = 192 Mo (jp2 lossless)
- `master-gmd-gmd5-g5834-g5834p-ct003571_lossy.jp2` = 46 Mo (jp2 lossy)


## Librairies image

### OpenJPEG

Github : [https://github.com/uclouvain/openjpeg](https://github.com/uclouvain/openjpeg)

#### Installation

MacOS :

```
$ brew install openjpeg
```

Binaires installés dans `/opt/homebrew/bin/`.

Compilation à partir des sources : [https://github.com/uclouvain/openjpeg/blob/master/INSTALL.md](https://github.com/uclouvain/openjpeg/blob/master/INSTALL.md)

Documentation : [https://github.com/uclouvain/openjpeg/wiki/DocJ2KCodec](https://github.com/uclouvain/openjpeg/wiki/DocJ2KCodec)

#### Usage

Lossless :

```
$ opj_compress -i [input_file] -o [output_file] -r 1 -n 7 -c [256,256],[256,256],[256,256],[256,256],[256,256],[256,256],[256,256],[128,128] -t 512,512 -p RPCL -b 64,64 -SOP -EPH -TP R -PLT
```

Lossy :

```
$ opj_compress -i [input_file] -o [output_file] -r 8 -n 7 -c [256,256],[256,256],[256,256],[256,256],[256,256],[256,256],[256,256],[128,128] -t 512,512 -p RPCL -b 64,64 -SOP -EPH -TP R -PLT
```

### zimeon/iiif

Github : [https://github.com/zimeon/iiif](https://github.com/zimeon/iiif)

#### Installation

MacOS :

```
// crée et active un nouveau venv
$ conda create -n py39 python=3.9
$ conda activate py39

// install
$ pip install iiif
```

#### Usage

IIIF Image API v2.1 level 0 :

```
$ iiif_static.py --dst demo/tiles/iiif2 --prefix http://localhost:8081/demo/tiles/iiif2 --tilesize 512 --api 2.1 [input_file]
```

Documentation (options) : [https://github.com/zimeon/iiif/blob/main/iiif_static.py#L23](https://github.com/zimeon/iiif/blob/main/iiif_static.py#L23)


### VIPS

Site : [https://www.libvips.org](https://www.libvips.org)

#### Installation

MacOS :

```
$ brew install vips
```

### Usage

Pyramid TIFF :

```
$ vips tiffsave [input_file] [output_file] --compression deflate --tile --pyramid --tile-width 256 --tile-height 256
```

IIIF Image API v3 level 0 :

```
vips dzsave [input_file] demo/tiles/iiif3/ --layout iiif3 --tile-size 512 --basename [folder]

```

Documentation : [https://www.libvips.org/API/current/Making-image-pyramids.html](https://www.libvips.org/API/current/Making-image-pyramids.html)


## Serveurs images

### Cantaloupe

Github : [https://github.com/cantaloupe-project/cantaloupe](https://github.com/cantaloupe-project/cantaloupe)

Documentation : [https://cantaloupe-project.github.io](https://cantaloupe-project.github.io)

#### Installation

MacOS :

```
// Télécharge une release
$ wget https://github.com/cantaloupe-project/cantaloupe/releases/download/v5.0.5/cantaloupe-5.0.5.zip

$ cd ~/opt/cantaloupe-5.0.5/
$ mv cantaloupe.properties.sample cantaloupe.properties
$ subl cantaloupe.properties
```

Options de configuration dans `cantaloupe.properties` :

```
http.host = localhost
FilesystemSource.BasicLookupStrategy.path_prefix = [/path/to/images/]
endpoint.admin.enabled = true
processor.selection_strategy = ManualSelectionStrategy
processor.ManualSelectionStrategy.jp2 = OpenJpegProcessor
OpenJpegProcessor.path_to_binaries = [/path/to/opj_decompress]
```

#### Usage

```
// Lancer Cantaloupe
$ java -Dcantaloupe.config=~/opt/cantaloupe-5.0.5/cantaloupe.properties -jar ~/opt/cantaloupe-5.0.5/cantaloupe-5.0.5.jar
```

Racine du serveur : [http://localhost:8182/iiif/3](http://localhost:8182/iiif/3)

Control panel : [http://localhost:8182/admin](http://localhost:8182/admin) (admin/admin)
