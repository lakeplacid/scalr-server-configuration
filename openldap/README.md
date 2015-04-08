OpenLDAP Sample Scalr Configuration
===================================

This configuration assumes your LDAP structure looks like this:

    + DC=example,DC=com
      + OU=users
        + CN=Dave Developer
        + CN=Sy Sysadmin
      + OU=groups
        + CN=dev
        + CN=admin

Furthermore, it assumes that:

  + The object class for your users is `posixAccount`
  + The object class for your groups is `groupOfNames`
  + The `member` attribute on groups holds user `DN`'s
  + Users will login using their `CN`
  + Groups will be referenced using  their `CN`

Those assumptions will most likely not (all) apply to your LDAP structure! Tune
the file as needed.

Note that there are some other configuration options available in Scalr's LDAP
integration. View the documentation for more information.
