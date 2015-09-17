# Disable all components by default
enable_all false
 
# Specify server 1 as the database server
app[:mysql_scalr_host] = '10.240.215.182'
 
# Tell MySQL to listen to all interfaces to allow cross server communication
mysql[:bind_host] = '0.0.0.0'
