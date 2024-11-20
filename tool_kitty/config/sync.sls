# vim: ft=sls

{#-
    Syncs the Kitty package configuration
    with a dotfiles repo.
    Has a dependency on `tool_kitty.package`_.
#}

{%- set tplroot = tpldir.split("/")[0] %}
{%- from tplroot ~ "/map.jinja" import mapdata as kitty with context %}
{%- from tplroot ~ "/libtofsstack.jinja" import files_switch %}


{%- for user in kitty.users | selectattr("dotconfig", "defined") | selectattr("dotconfig") %}
{%-   set dotconfig = user.dotconfig if user.dotconfig is mapping else {} %}

Kitty configuration is synced for user '{{ user.name }}':
  file.recurse:
    - name: {{ user["_kitty"].confdir }}
    - source: {{ files_switch(
                    ["kitty"],
                    lookup="Kitty configuration is synced for user '{}'".format(user.name),
                    config=kitty,
                    path_prefix="dotconfig",
                    files_dir="",
                    custom_data={"users": [user.name]},
                 )
              }}
    - context:
        user: {{ user | json }}
    - template: jinja
    - user: {{ user.name }}
    - group: {{ user.group }}
{%-   if dotconfig.get("file_mode") %}
    - file_mode: '{{ dotconfig.file_mode }}'
{%-   endif %}
    - dir_mode: '{{ dotconfig.get("dir_mode", "0700") }}'
    - clean: {{ dotconfig.get("clean", false) | to_bool }}
    - makedirs: true
{%- endfor %}
