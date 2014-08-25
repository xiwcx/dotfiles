# Storage Instructions

## Time Machine

Set up with Netatalk and Avahi. Followed instructions at [Concisest guide to setting up Time Machine server on Ubuntu Server 12.04](http://d43.me/blog/1660/concisest-guide-to-setting-up-time-machine-server-on-ubuntu-server-12-04/).

Config located at `/etc/netatalk/AppleVolumes.default`

## LAN File Server

Set up with Samba and Avahi. Followed instructions at [Making A Linux File Server That Interacts With OS X Mavericks](http://www.andyibanez.com/making-linux-file-server-interacts-os-x-mavericks/).

Config located at `/etc/samba/smb.conf` (sharing) and `/etc/avahi/services/smb.service` (pretty little icon)
