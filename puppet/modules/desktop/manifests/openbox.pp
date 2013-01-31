# == Class: desktop::openbox
#
# Installs the Openbox window manager and environment
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::openbox {
    include desktop::openbox::config, desktop::openbox::install
}
