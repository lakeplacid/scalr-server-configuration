# Enable the cron component
cron[:enable] = true

# Enable the worker component ...
service[:enable] = true

# ... but disable the plotter and the poller
service[:disable] = ['plotter', 'poller']
