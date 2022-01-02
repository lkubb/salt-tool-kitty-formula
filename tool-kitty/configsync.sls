{%- from 'tool-kitty/map.jinja' import kitty %}

{%- for user in kitty.users | selectattr('dotconfig', 'defined') | selectattr('dotconfig') %}
kitty configuration is synced for user '{{ user.name }}':
  file.recurse:
    - name: {{ user._kitty.confdir }}
    - source:
      - salt://dotconfig/{{ user.name }}/kitty
      - salt://dotconfig/kitty
    - context:
        user: {{ user }}
    - template: jinja
    - user: {{ user.name }}
    - group: {{ user.group }}
    - file_mode: keep
    - dir_mode: '0700'
    - makedirs: True
{%- endfor %}
