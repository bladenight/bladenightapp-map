# Map file and tools

This repository contains the tools to generate the map file required for the bladenight
app. The data is downloaded from geofabrik.de and transformed using osmosis.

Since SBahn and UBahn stations are important landmarks, they are treated specially
and displayed on the map with the corresponding icon.

To generate the map, just call "generate-map.sh".

If you want to update the UBahn and SBahn stations:
* Run extract-subway.sh
* Open railway-stations.osm with JSOM
* Add ubahn=yes and sbahn=yes (TBD more required details here)
* Save it



