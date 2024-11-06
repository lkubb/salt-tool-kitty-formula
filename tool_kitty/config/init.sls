# vim: ft=sls

{#-
    Manages the Kitty package configuration by

    * recursively syncing from a dotfiles repo

    Has a dependency on `tool_kitty.package`_.
#}

include:
  - .sync
