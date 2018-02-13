4-Server Scalr Deployment
=========================

A typical Scalr deployment topology for small to medium deployments, composed
of:

  + App Server, also running the Proxy, Load Statistics, and Memcached
    ([`scalr-server-local.app.rb`][10])
  + Worker Server ([`scalr-server-local.worker.rb`][11])
  + Main DB Server ([`scalr-server-local.db.rb`][12])
  + Cost Analytics DB Server ([`scalr-server-local.db.rb`][12])

The main configuration file is in [`scalr-server.rb`][20].

  [10]: ./scalr-server-local.app.rb
  [11]: ./scalr-server-local.worker.rb
  [12]: ./scalr-server-local.db.rb
  [20]: ./scalr-server.rb
