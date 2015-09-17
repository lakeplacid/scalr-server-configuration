High Availibility & Fail Over
=========================

A typical Scalr production environment will be setup with HA and/or failover in mind, in
case any of the server/components will fail.

  + Proxy (HA, Stateless)
  + App Server (HA, Stateless)
  + Load Statistics (Failover, Stateful)
  + Worker Server (Failover, Stateless)
  + Sessions Server (HA, Stateless)
  + Database Server (Failover, Stateful)

Follow the [tutorial][10] on the wiki to make sense of the config files in this repo.

  [10]: https://scalr-wiki.atlassian.net/wiki/x/HQA9AQ
