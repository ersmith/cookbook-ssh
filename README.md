ssh Cookbook
============
This cookbook configures ssh.  It has recipes for both the ssh_config and the sshd_config files.

Requirements
------------
This cookbook currently makes some assumptions.  It assumes that the install is setup in such a way that the config files can be found under /etc/ssh.

Attributes
----------
TODO

e.g.
#### ssh::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ssh']['config_location']</tt></td>
    <td>String</td>
    <td>The path to where ssh config files are located.</td>
    <td><tt>/etc/ssh</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh']['sshd']['port']</tt></td>
    <td>Integer</td>
    <td>The port the ssh daemon should listen on.</td>
    <td><tt>22</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh']['sshd']['x11_forwarding']</tt></td>
    <td>yes/no</td>
    <td>Whether or not X11Forwarding should be allowed.</td>
    <td><tt>no</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh']['sshd']['password_authentication']</tt></td>
    <td>yes/no</td>
    <td>Whether or not password authentication should be allowed.  Although it is yes by default, it is recommended to change it to false once a user with an appropriate key is setup.</td>
    <td><tt>yes</tt></td>
  </tr>
</table>

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
