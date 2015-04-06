########################################################################################
# IMPORTANT: This is NOT a substitute for documentation. Make sure that you understand #
# the configuration parameters you use in your configuration file.                     #
########################################################################################

# Disable all services. Everything else will be re-enabled in scalr-server-local.rb
enable_all false


# Use separate MySQL
app[:mysql_scalr_host] = '127.0.0.1'      # Host for the Scalr MySQL database.
app[:mysql_scalr_port] = 3306             # Port for the Scalr MySQL database. (note that by default the installer sets up MySQL to listen on port 6280).

app[:mysql_analytics_host] = '127.0.0.1'  # Host for the Analytics MySQL database.
app[:mysql_analytics_port] = 3306         # Port for the Analytics MySQL database (same as above).
