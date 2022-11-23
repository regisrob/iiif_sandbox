# Cantaloupe

## Installation

Installation à partir d'une release, déploiement dans Tomcat :

```
# wget https://github.com/medusa-project/cantaloupe/releases/download/v4.0.3/cantaloupe-4.0.3.zip
# unzip cantaloupe-4.0.3.zip
# mv cantaloupe-4.0.3/cantaloupe-4.0.3.war /var/lib/tomcat8/webapps
# mv cantaloupe-4.0.3/cantaloupe.properties.sample /var/lib/tomcat8/conf/cantaloupe.properties
# nano /usr/share/tomcat8/bin/setenv.sh
```
export CATALINA_OPTS="$CATALINA_OPTS -Dcantaloupe.config=/var/lib/tomcat8/conf/cantaloupe.properties"
```



## Configuration

- Options de démarrage : `/usr/share/tomcat8/bin/setenv.sh`
- Dossier images : `/usr/local/share/iiif-images`
- Fichier de conf : `/var/lib/tomcat8/conf/cantaloupe.properties` :
  - `FilesystemSource.lookup_strategy = BasicLookupStrategy`
  - `processor.jp2 = OpenJpegProcessor`
  - `OpenJpegProcessor.path_to_binaries = /usr/local/bin`
  - `cache.server.source = FilesystemCache`
  - `FilesystemCache.pathname = /var/cache/cantaloupe`





