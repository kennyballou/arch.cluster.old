# == Class: devel_tools
#
# Installs an assortment of tools for development
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel_tools {
    include devel_tools::config, devel_tools::install
}
