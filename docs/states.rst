Available states
----------------

The following states are found in this formula:

.. contents::
   :local:


``tool_kitty``
~~~~~~~~~~~~~~
*Meta-state*.

Performs all operations described in this formula according to the specified configuration.


``tool_kitty.package``
~~~~~~~~~~~~~~~~~~~~~~
Installs the Kitty package only.


``tool_kitty.config``
~~~~~~~~~~~~~~~~~~~~~
Manages the Kitty package configuration by

* recursively syncing from a dotfiles repo

Has a dependency on `tool_kitty.package`_.


``tool_kitty.clean``
~~~~~~~~~~~~~~~~~~~~
*Meta-state*.

Undoes everything performed in the ``tool_kitty`` meta-state
in reverse order.


``tool_kitty.package.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the Kitty package.
Has a dependency on `tool_kitty.config.clean`_.


``tool_kitty.config.clean``
~~~~~~~~~~~~~~~~~~~~~~~~~~~
Removes the configuration of the Kitty package.


