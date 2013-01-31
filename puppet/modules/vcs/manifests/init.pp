# == Class: vcs
#
# Installs source/revision control tools
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class vcs {
    include vcs::config, vcs::install
}
