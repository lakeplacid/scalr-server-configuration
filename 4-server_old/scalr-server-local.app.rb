# Proxy
proxy[:enable] = true

# Memcached
memcached[:enable] = true

# App and Grahics
web[:enable] = true

# Load Statistics (Graphics is already enabled as part of Web)
rrd[:enable] = true
service[:enable] = ['plotter', 'poller']
