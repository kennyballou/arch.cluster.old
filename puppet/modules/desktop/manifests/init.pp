# == Class: desktop
#
# Installs packages for a workstation node
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop {
    include desktop::config, desktop::install
}
