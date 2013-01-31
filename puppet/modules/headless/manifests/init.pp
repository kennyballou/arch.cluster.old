# == Class: headless
#
# Sets up and installs required software for headless node
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class headless {
    include headless::config, headless::install
}
