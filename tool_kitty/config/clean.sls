# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as kitty with context %}


{%- for user in kitty.users %}

Kitty config dir is absent for user '{{ user.name }}':
  file.absent:
    - name: {{ user['_kitty'].confdir }}
{%- endfor %}
