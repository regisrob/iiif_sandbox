# Deploying Loris using Docker


Loris provides a Docker version of the image server.

[https://github.com/loris-imageserver/loris-docker](https://github.com/loris-imageserver/loris-docker)


## Installing Docker

Mac:
 
 [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)

Windows: 

[https://docs.docker.com/docker-for-windows/install/](https://docs.docker.com/docker-for-windows/install/)

Linux:

   * Centos: [https://docs.docker.com/install/linux/docker-ce/centos/](https://docs.docker.com/install/linux/docker-ce/centos/)
   * Ubuntu: [https://docs.docker.com/install/linux/docker-ce/centos/](https://docs.docker.com/install/linux/docker-ce/centos/)
   
   

## Running Loris

There is a shell script provided in this repository, if you run:

```bash
./loris_docker.sh
```

This script will download the correct Docker image and spin up a Loris image server, and serve images from the `./images` folder.

You can test if this is working by loading:

[http://localhost:8000/test.jp2/info.json](http://localhost:8000/test.jp2/info.json)

in your browser to check an `info.json` file is being returned.

Then try:

[http://localhost:8000/test.jp2/full/250,/90/default.jpg](http://localhost:8000/test.jp2/full/250,/90/default.jpg)

The documentation at:

[https://github.com/loris-imageserver/loris-docker](https://github.com/loris-imageserver/loris-docker
) 
provides more general information on spinning up the Dockerised version, although with one caveat, it may be necessary to change the volume mapping from:


```bash
docker run -d -v <your-img-folder>:/usr/local/share/images -p 5004:5004 <docker-image>
```

to

```bash
docker run -d -v <your-img-folder>:/opt/loris/tests/img -p 5004:5004 <docker-image>
```

if you are following that documentation.
