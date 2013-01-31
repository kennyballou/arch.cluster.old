# == Class python::install
#
# Installation class for `python`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class python::install {
    package {'python':
        ensure => installed,
    }

    package {'python2':
        ensure => installed,
    }
}
