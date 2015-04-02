ssh Cookbook
============
This cookbook installs and configures the openssh client and server.

Requirements
------------
This cookbook requires that the package resource has a resource for the specific platform.  See [the opscode documentation](http://docs.opscode.com/resource_package.html) for a list of supported platforms.  It also makes the assumption that both the server and client place their configuration in the same directory.

Recipes
-------
The ssh cookbook is made up of three recipes.

### default
This recipe runs both the `client` and `server` recipes.

### default


Attributes
----------
See attributes/default.rb for default values.

* `node[:ssh][:config_location]` - The location of the config files.
* `node[:ssh][:client][:package_name]` - The package to use for the ssh client.
* `node[:ssh][:server][:package_name]` - The package to use for the ssh server.
* `node[:ssh][:server][:enable_on_boot]` - Whether or not the ssh server should be started on boot.
* `node[:ssh][:server][:config][:port]` - The port the ssh daemon will listen on.
* `node[:ssh][:server][:config][:x11_forwarding]` - Whether or not X11Forwarding should be allowed.
* `node[:ssh][:server][:config][:password_authentication]` - Whether or not password authentication is allowed.
* `node[:ssh][:server][:config][:permit_root_login]` - Whether or not the root user should be able to login using ssh.

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

Each of the recipes is independent of the rest allowing them to be used individually.

Contributing
------------
All contributions are welcome.  To contribute fork the repository, create a feature branch and the submit a pull request using Github when you are ready.

License and Authors
-------------------
Authors: Edward Smith
