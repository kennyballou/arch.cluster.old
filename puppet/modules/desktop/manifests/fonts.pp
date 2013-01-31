# == Class: desktop::fonts
#
# Installs an assortment of fonts
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::fonts {
    include desktop::fonts::config, desktop::fonts::install
}
