External MySQL Deployment
=========================

A single server deployment that uses an external MySQL server.

The main configuration file is in [`scalr-server.rb`][10], and the local
configuration file is in [`scalr-server-local.rb`][11]. You can of course
mix-and-match those configuration files with other samples from this
repository.


MySQL Setup
-----------

When using an external MySQL Server, there are several initial setup steps you
must go through:

  + Create a user for Scalr in MySQL (ideally, call this user `scalr`).
  + Create two databases in MySQL for Scalr: `scalr` and `analytics`.
  + Grant all permissions to the Scalr user on those databases.

Then, run `scalr-server-wizard`. This will generate a secrets file in
`/etc/scalr-server/scalr-server-secrets.json`. Replace the value of
`scalr_password` with the password you created for the `scalr` user (you can
safely ignore the other MySQL passwords; they will not be used).

  [10]: ./scalr-server.rb
  [11]: ./scalr-server-local.rb
