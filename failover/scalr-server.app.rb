# Tell the proxy component what app servers to forward requests to
proxy[:app_upstreams] = ['1.1.1.1:6000', '2.2.2.2:6000']

# What IP should the app component listen on
web[:app_bind_host] = '0.0.0.0'

# What port should the app component listen on
web[:app_bind_port] = 6000
