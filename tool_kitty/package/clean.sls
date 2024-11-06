# vim: ft=sls

{#-
    Removes the Kitty package.
    Has a dependency on `tool_kitty.config.clean`_.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- set sls_config_clean = tplroot ~ ".config.clean" %}
{%- from tplroot ~ "/map.jinja" import mapdata as kitty with context %}

include:
  - {{ sls_config_clean }}


Kitty is removed:
  pkg.removed:
    - name: {{ kitty.lookup.pkg.name }}
    - require:
      - sls: {{ sls_config_clean }}
