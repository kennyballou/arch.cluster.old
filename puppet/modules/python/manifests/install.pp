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
        ensure => latest,
    }

    package {'python2':
        ensure => latest,
    }
}
