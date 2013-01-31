# == Class python
#
# Installs both python and python2
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class python {
    include python::config, python::install
}
