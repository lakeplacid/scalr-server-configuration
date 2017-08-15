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
ENDPOINT = 'loadbalancer or hostname of endpoint'  # This MUST be reachable by your instances.
MAIN_MYSQL_SERVER_HOST = 'main mysql server hostname'
CA_MYSQL_SERVER_HOST = 'cost analytics hostname'
SERVER_1 = 'scalr server1 hostname'
SERVER_2 = 'scalr server2 hostname'
MEMCACHED_PORT = "11211"


####################
# External Routing #
####################

proto = 'http'  # Set up the SSL settings and this to 'https' to use HTTPS

routing[:endpoint_scheme] = proto
routing[:endpoint_host] = ENDPOINT

routing[:graphics_scheme] = proto
routing[:graphics_host] = ENDPOINT

routing[:plotter_scheme] = proto
routing[:plotter_host] = ENDPOINT
routing[:plotter_port] = if proto == 'http' then 80 else 443 end


####################
# Internal Routing #
####################

# Use separate hosts for MySQL
app[:mysql_scalr_host] = MAIN_MYSQL_SERVER_HOST
app[:mysql_scalr_port] = 3306

app[:mysql_analytics_host] = CA_MYSQL_SERVER_HOST
app[:mysql_analytics_port] = 3306

# Memcached Servers
app[:memcached_servers] = [SERVER_1 + ':' + MEMCACHED_PORT, SERVER_2 + ':' + MEMCACHED_PORT]
# Only needs to be done prior to 7.7.2: Disable sasl
memcached[:enable_sasl] = false

# Look for the app and graphics locally as well
proxy[:app_upstreams] = ['127.0.0.1:6000']
proxy[:graphics_upstreams] = ['127.0.0.1:6100']
proxy[:plotter_upstreams]  = ['127.0.0.1:6200']

# Bind the proxy publicly
proxy[:bind_host] = '0.0.0.0'

# But bind locally, since it'll go through the proxy
web[:app_bind_host] = '127.0.0.1'
web[:app_bind_port] = 6000

web[:graphics_bind_host] = '127.0.0.1'
web[:graphics_bind_port] = 6100

service[:plotter_bind_host] = '127.0.0.1'
service[:plotter_bind_port] = 6200

# Bind MySQL publicly, because it'll need to be accessed by the app & worker
mysql[:bind_host] = '0.0.0.0'
mysql[:bind_port] = 3306

memcached[:bind_host] = '0.0.0.0'
memcached[:bind_port] = 11211

/opt/scalr-server/bin/kickstart-replication 52.53.248.7:3306 54.215.186.112:3306
