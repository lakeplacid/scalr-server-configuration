4-Server-HA Scalr Deployment
=========================

A typical Scalr HA deployment topology for small to medium deployments is composed
of:

  + Proxy, App, Sessions, Stats(disabled), and Worker Server(disabled) scalr-server-local.1.rb
  + Proxy, App, Sessions, Stats, and Worker Server scalr-server-local.2.rb
  + Primary DB Server scalr-server-local.mysql1.rb
  + Secondary DB Server scalr-server-local.mysql2.rb

** All local files above should be renamed to "scalr-server-local.rb" when they are placed on their respective servers.

The main configuration file is scalr-server.rb and should be copied to all servers.
