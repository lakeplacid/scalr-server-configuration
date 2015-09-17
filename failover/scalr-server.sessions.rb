# Tell the app component where it can find the session servers
app[:memcached_servers] = ['server-1:11211', 'server-2:11211']

# Specify what IP and Port the memcache component should listen to
memcached[:bind_host] = '0.0.0.0'
memcached[:bind_port] = 11211
