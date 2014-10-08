# Data

Get the csv files and import them in Impala
* weblog.csv.gz
* geoip.csv.gz
* countries.csv

# How the data was generated

The script NASA_to_csv.sh first downloads the NASA weblog set from ftp://ita.ee.lbl.gov/traces/NASA_access_log_Jul95.gz and splits the file into columns.
An external service (freegeoip) is called to translate the domain names into geoip information. If you want to run the service locally, see the [freegeoip project](https://github.com/fiorix/freegeoip).

The countries is extracted from the output of the geoip service.

Finally, the date information in the NASA weblog file is converted to Impala's timestamp format (script NASA_fix_timestamp.sh) and a post fix is applied that fixes a trailing column (NASA_fix_columns.sh)
