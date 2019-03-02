#!/bin/sh

minlat=48.0
minlon=11.4
maxlat=48.3
maxlon=11.8

OSMOSIS=osmosis-0.40.1/bin/osmosis

if [ ! -f oberbayern-latest.osm.pbf ] ; then
wget http://download.geofabrik.de/europe/germany/bayern/oberbayern-latest.osm.pbf || exit 1
fi

if [ ! -f munich.osm ] ; then
time ( "$OSMOSIS" --rb oberbayern-latest.osm.pbf --bb left=$minlon bottom=$minlat right=$maxlon top=$maxlat --wx munich.osm ) || exit 1
fi

TMPFILE=merged.osm

time "$OSMOSIS" \
  --rx file=munich.osm  \
  --rx railway-stations.osm \
  --merge \
  --wx "$TMPFILE"  || exit 1



export JAVACMD_OPTIONS=-Xmx2G
time "$OSMOSIS" \
  --rx file="$TMPFILE"  \
  --mapfile-writer      \
  file=munich.map       \
  map-start-position=48.132453,11.543895  \
  bbox=$minlat,$minlon,$maxlat,$maxlon    \
  tag-conf-file=tag-mapping.xml \
  || exit 1


