# vim: ft=sls

{#-
    Removes the configuration of the Kitty package.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as kitty with context %}


{%- for user in kitty.users %}

Kitty config dir is absent for user '{{ user.name }}':
  file.absent:
    - name: {{ user["_kitty"].confdir }}
{%- endfor %}
