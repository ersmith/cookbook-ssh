ssh Cookbook
============
This cookbook configures ssh.  It has recipes for both the ssh_config and the sshd_config files.

Requirements
------------
This cookbook currently makes some assumptions.  It assumes that the install is setup in such a way that the config files can be found under /etc/ssh.

Attributes
----------
See attributes/default.rb for default values.

* `node['ssh']['config_location']` - The location of the config files.
* `node['ssh']['sshd']['port']` - The port the ssh daemon will listen on.
* `node['ssh']['sshd']['x11_forwarding']` - Whether or not X11Forwarding should be allowed.
* `node['ssh']['sshd']['password_authentication']` - Whether or not password authentication is allowed.

Usage
-----
#### ssh::default
As this recipe merely copies the config files it is fairly easy to use.  The basic usage consists of adding the recipe to the run_list.

e.g.

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ssh]"
  ]
}
```

There are two separate recipes for the ssh and the sshd config files and are completely independent.

Contributing
------------
All contributions are welcome.  To contribute fork the repository, create a feature branch and the submit a pull request using Github when you are ready.

License and Authors
-------------------
Authors: Edward Smith
