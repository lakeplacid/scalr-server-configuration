# Tell the proxy component where to send requests for graphics
proxy[:graphics_upstreams] = ['1.1.1.1:6100']

# Tell the proxy component where to send requests for plotter
proxy[:plotter_upstreams]  = ['2.2.2.2:6200']

# Specify what IP and port the graphics component should listen on
web[:graphics_bind_host] = '0.0.0.0'
web[:graphics_bind_port] = 6100

# Specify what IP and port the plotter component should listen on
service[:plotter_bind_host] = '0.0.0.0'
service[:plotter_bind_port] = 6200
