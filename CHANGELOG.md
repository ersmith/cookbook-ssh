ssh CHANGELOG
=============

This file is used to list changes made in each version of the ssh cookbook.

0.1.0
-----
- Edward Smith - Initial release of ssh

0.3.0
- Edward Smith - Combined the ssh_config recipe into the ssh_client recipe
- Edward Smith - Combined the sshd_config recipe into the ssh_server recipe
- Edward Smith - Added support for `PermitRootLogin` in the sshd config file
- Edward Smith - Renamed `ssh_client.rb` to `client.rb`
- Edward Smith - Renamed `ssh_server.rb` to `server.rb`
- Edward Smith - Updated the `client` recipe to have the correct package name for CentOS
- Edward Smith - Updated the `server` recipe to have the correct service name for CentOS

- - -
Check the [Markdown Syntax Guide](http://daringfireball.net/projects/markdown/syntax) for help with Markdown.

The [Github Flavored Markdown page](http://github.github.com/github-flavored-markdown/) describes the differences between markdown on github and standard markdown.
