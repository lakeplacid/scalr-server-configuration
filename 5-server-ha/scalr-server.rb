########################################################################################
# IMPORTANT: This is NOT a substitute for documentation. Make sure that you understand #
# the configuration parameters you use in your configuration file.                     #
########################################################################################

##########################
# Topology Configuration #
##########################
# You can use IPs for the below as well, but hostnames are preferable.
ENDPOINT = 'loadbalancer or hostname of endpoint'
MASTER_MYSQL_SERVER_HOST = 'master mysql server hostname'
SLAVE_MYSQL_SERVER_HOST = 'slave mysql server hostname'
APP_SERVER_1 = 'Enter App Server 1 Here'
APP_SERVER_2 = 'Enter App Server 2 Here'
WORKER_SERVER = 'Enter Worker Server Here'
INFLUXDB_SERVER = 'Enter InfluxDB Server Here'
MEMCACHED_PORT = "11211"

####################
 # External Routing #
####################
enable_all false

proto = 'https'  # Set up the SSL settings and this to 'https' to use HTTPS

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

## In the event of a failover event, change this to SLAVE_MYSQL_SERVER_HOST
app[:mysql_scalr_host] = MASTER_MYSQL_SERVER_HOST
app[:mysql_scalr_port] = 3306

## In the event of a failover event, change this to SLAVE_MYSQL_SERVER_HOST
app[:mysql_analytics_host] = MASTER_MYSQL_SERVER_HOST
app[:mysql_analytics_port] = 3306

# Memcached Servers
app[:memcached_servers] = [APP_SERVER_1 + ':' + MEMCACHED_PORT, APP_SERVER_2 + ':' + MEMCACHED_PORT]
# Only needs to be done prior to 7.7.2: Disable sasl
memcached[:enable_sasl] = false

# Look for the app and graphics locally as well
proxy[:app_upstreams] = ['127.0.0.1:6000']
proxy[:graphics_upstreams] = ['0.0.0.0:6100']
proxy[:plotter_upstreams]  = ['0.0.0.0:6200']

# Bind the proxy publicly
proxy[:bind_host] = '0.0.0.0'

# But bind locally, since it'll go through the proxy
web[:app_bind_host] = '127.0.0.1'
web[:app_bind_port] = 6000

web[:graphics_bind_host] = '0.0.0.0'
web[:graphics_bind_port] = 6100

service[:plotter_bind_host] = '0.0.0.0'
service[:plotter_bind_port] = 6200

# Bind MySQL publicly, because it'll need to be accessed by the app & worker
mysql[:bind_host] = '0.0.0.0'
mysql[:bind_port] = 3306

memcached[:bind_host] = '0.0.0.0'
memcached[:bind_port] = 11211

# Scalr Web/AMQP Host
#routing[:endpoint_host] = proxy_host
app[:influxdb_host] = INFLUXDB_SERVER
influxdb[:http_bind_host] = '0.0.0.0'
proxy[:amqps_bind_port] = 5671
app[:rabbitmq_host] = INFLUXDB_SERVER
rabbitmq[:bind_host] = '0.0.0.0'
rabbitmq[:mgmt_bind_host] = '0.0.0.0'

# Disable all services by default

app[:configuration] = {
  :scalr => {
      :monitor => {
            :enabled => true,
        },
        :workflow_engine => {
            :enabled => true,
            :rabbitmq => {
                :public_host => "#{routing[:endpoint_host]}:#{proxy[:amqps_bind_port]}"
        }
     }
   }
 }
