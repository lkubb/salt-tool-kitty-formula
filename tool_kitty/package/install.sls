# -*- coding: utf-8 -*-
# vim: ft=sls

{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as kitty with context %}


Kitty is installed:
  pkg.installed:
    - name: {{ kitty.lookup.pkg.name }}
{%- if 'Darwin' != grains.kernel %}
    - version: {{ kitty.get('version') or 'latest' }}
    {#- do not specify alternative return value to be able to unset default version #}
{%- endif %}

Kitty setup is completed:
  test.nop:
    - name: Hooray, Kitty setup has finished.
    - require:
      - pkg: {{ kitty.lookup.pkg.name }}
