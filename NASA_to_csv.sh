#
# get the NASA logs
#
wget -X GET -O NASA.csv.gz ftp://ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz
#
# create tab-separated csv file. Note \t is tab character, for OSX systems, use CTRL+V TAB to insert tab in command
#
zcat NASA.csv | sed "s/ - - \[/\t/g" | sed "s/\] \"/\t/g" | sed "s/\" /\t/g" | sed "s/\([0-9]*\) \([0-9]*\)$/ \1\t\2 /g" > NASA.csv
#
# get the geoip information for each NASA weblog. Prerequisite: freegeoip, open source tool on 
#
./get_geoip.sh NASA.csv > geoip_raw.csv
#
# create file with country_code + country_name 
#
grep -v "Not Found" geoip_raw.csv | cut -f 6-7 | sort | uniq > countries.csv
#
# extract the country_name from the geoip file (only purpose is to add an extra join in the tutorial)
#
grep -v "Not Found" geoip_raw.csv | cut -f 1-6 > geoip.csv 
