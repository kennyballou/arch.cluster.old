# == Class: devel::python
#
# Installs extra python libraries
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::python {
    include devel::python::config, devel::python::install
}
