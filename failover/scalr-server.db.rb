# Tell the app which database host to connect to for main database
app[:mysql_scalr_host] = 'db'
app[:mysql_scalr_port] = 3306

# Tell the app which database host to connect to for the analytics database
app[:mysql_analytics_host] = 'ca'
app[:mysql_analytics_port] = 3306

# Specify what IP and post the database component should listen on
mysql[:bind_host] = '0.0.0.0'
mysql[:bind_port] = 3306
