{%- from 'tool-kitty/map.jinja' import kitty -%}

Kitty Terminal Emulator is installed:
  pkg.installed:
    - name: {{ kitty.package }}
