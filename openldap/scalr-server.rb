app[:configuration] = {
  :scalr => {
    # Tells Scalr to use LDAP for authentication
    :auth_mode => 'ldap',

    :connections => {
      :ldap => {
        # Tells Scalr what LDAP server to connect to
        :bind_type => 'openldap',
        :host => 'ldap://your.server',
        :port => '389',

        # Tells Scalr where to look at for users and groups
        :base_dn => 'OU=users,DC=example,DC=com',
        :base_dn_groups => 'OU=groups,DC=example,DC=com',

        # Tells Scalr what attributes to look at
        :username_attribute => 'CN',
        :groupname_attribute => 'CN',

        # Tells Scalr how group membership is represented
        :group_member_attribute_type => 'user_dn',

        # Tells Scalr to use filters to speed up queries
        :filter => {
          :users => '(&(objectClass=posixAccount))',
          :groups => '(&(objectClass=groupOfNames))',
        },

        # Uncomment for debug output if you can't login
        # :debug => 1,
      }
    }
  }
}

# This will be injected into your ldap.conf
app[:ldap_configuration] = '
TLS_CACERT /etc/ssl/ca-cert.pem
'
