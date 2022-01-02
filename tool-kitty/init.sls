{%- from 'tool-kitty/map.jinja' import kitty %}

include:
  - .package
{%- if kitty.users | selectattr('dotconfig', 'defined') | selectattr('dotconfig') %}
  - .configsync
{%- endif %}
