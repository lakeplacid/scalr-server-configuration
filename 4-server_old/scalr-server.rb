########################################################################################
# IMPORTANT: This is NOT a substitute for documentation. Make sure that you understand #
# the configuration parameters you use in your configuration file.                     #
########################################################################################

# Disable all services by default
enable_all false


##########################
# Topology Configuration #
##########################

# You can use IPs for the below as well, but hostnames are preferable.
app_server_host = '????'  # This MUST be reachable by your instances.
main_mysql_server_host = '???'
ca_mysql_server_host = '???'

# Server IPs. Those MUST be IPs, not hostnames.
app_server_ip = '???'
worker_server_ip = '???'


####################
# External Routing #
####################

proto = 'http'  # Set up the SSL settings and this to 'https' to use HTTPS
endpoint = app_server_host

routing[:endpoint_scheme] = proto
routing[:endpoint_host] = endpoint


####################
# Internal Routing #
####################

# Use separate hosts for MySQL
app[:mysql_scalr_host] = main_mysql_server_host
app[:mysql_scalr_port] = 3306

app[:mysql_analytics_host] = ca_mysql_server_host
app[:mysql_analytics_port] = 3306

# Use Memcached locally (it's running on the same servers as the app servers)
app[:memcached_servers] = ['127.0.0.1:11211']

# Look for the app and graphics locally as well
proxy[:app_upstreams] = ['127.0.0.1:6000']
proxy[:graphics_upstreams] = ['127.0.0.1:6100']
proxy[:plotter_upstreams]  = ['127.0.0.1:6200']

# Bind the proxy publicly
proxy[:bind_host] = '0.0.0.0'

# But bind everything else locally, since it'll go through the proxy
web[:app_bind_host] = '127.0.0.1'
web[:app_bind_port] = 6000

web[:graphics_bind_host] = '127.0.0.1'
web[:graphics_bind_port] = 6100

service[:plotter_bind_host] = '127.0.0.1'
service[:plotter_bind_port] = 6200

# Bind MySQL publicly, because it'll need to be accessed by the app & worker
mysql[:bind_host] = '0.0.0.0'
mysql[:bind_port] = 3306

# The app and Memcached are running on the same server, so bind locally
memcached[:bind_host] = '127.0.0.1'
memcached[:bind_port] = 11211


#####################
# App configuration #
#####################

app[:ip_ranges] = ["#{app_server_ip}/32", "#{worker_server_ip}/32",]
app[:instances_connection_policy] = 'local'  # Or 'public'
app[:configuration] = {}  # Add extra configuration here
