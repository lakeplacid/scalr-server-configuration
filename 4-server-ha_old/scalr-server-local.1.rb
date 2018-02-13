# Proxy
proxy[:enable] = true

# Memcached
memcached[:enable] = true

# App and Graphics
web[:enable] = true

# Load Statistics (Graphics is already enabled as part of Web)
rrd[:enable] = false

#Disable worker component, only one can be on at a time##
service[:enable] = false

#Cron
cron[:enable] = true
