# Putting it all together

## Grab some images

For example, from Flickr Commons:

`https://www.flickr.com/commons`

Download to the `olso_demos` folder.

## Convert those images to pyramid tiff (or jpeg2000)

```bash
sh ./open_jpeg.sh INPUT_FILE ./images/OUTPUT_FILE
```

and put the image in the images folder that Loris is serving from.

# Run Loris

If you aren't already running Loris, run Loris.

```bash
./loris_docker.sh
```

## Check it works

Try:

```
http://localhost:8000/OUTPUT_FILE/info.json
```

Then try:

```https://mcgrattan.org/osd.html?tilesource=http://localhost:8000/OUTPUT_FILE/info.json
```

Congratulations, you have a working (local) IIIF Image API server.

Repeat this process for as many images as you require.

## Create a manifest

Edit something like this:

```json
{
  "@context": "http://iiif.io/api/presentation/2/context.json",
  "@type": "sc:Manifest",
  "@id": "http://localhost:3000/manifest.json",
  "label": "Something brief but helpful",
  "description": "A longer and more descriptive piece of text.",
  "attribution": "My organisation",
  "logo": "https://iiif.io/img/logo-iiif-34x30.png",
  "sequences": [
    {
      "@type": "sc:Sequence",
      "canvases": [
        {
          "@type": "sc:Canvas",
          "@id": "urn://firstcanvas",
          "label": "Dock in Belfast",
          "width": 2500,
          "height": 1644,
          "images": [
            {
              "@type": "oa:Annotation",
              "motivation": "sc:painting",
              "on": "urn://firstcanvas",
              "resource": {
                "@type": "dctypes:Image",
                "@id": "http://localhost:8000/dock.jp2/full/500,/0/default.jpg",
                "service": {
                  "@context":  "http://iiif.io/api/image/2/context.json",
                  "@id": "http://localhost:8000/dock.jp2",
                  "profile": "http://iiif.io/api/image/2/level2.json"
                }
              }
            }
          ]
        },
        {
          "@type": "sc:Canvas",
          "@id": "urn://secondcanvas",
          "label": "Dock in somewhere else",
          "width": 1032,
          "height": 880,
          "images": [
            {
              "@type": "oa:Annotation",
              "motivation": "sc:painting",
              "on": "urn://firstcanvas",
              "resource": {
                "@type": "dctypes:Image",
                "@id": "http://localhost:8000/dock2.jp2/full/500,/0/default.jpg",
                "service": {
                  "@context":  "http://iiif.io/api/image/2/context.json",
                  "@id": "http://localhost:8000/dock2.jp2",
                  "profile": "http://iiif.io/api/image/2/level2.json"
                }
              }
            }
          ]
        }
      ]
    }
  ]
}
```

Go to [http://myjson.com/](http://myjson.com/) and paste in this json.

Copy the API link that MyJson provides, and use that to test in a IIIF Viewer:

[http://universalviewer.io/uv.html?manifest=https://api.myjson.com/bins/mcwt2](http://universalviewer.io/uv.html?manifest=https://api.myjson.com/bins/mcwt2)

Or go to ProjectMirador.


