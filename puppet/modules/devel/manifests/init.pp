# == Class: devel
#
# Installs an assortment of development languages and environments
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel {
    include devel::config, devel::install
}
