# == Class: misc
#
# Install a set of miscellaneous tools
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class misc {
    include misc::config, misc::install
}
