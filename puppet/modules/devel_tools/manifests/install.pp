# == Class: devel_tools::install
#
# Installation for `devel_tools`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel_tools::install {
    package {'gdb':
        ensure => latest,
    }

    package {'dmd':
        ensure => latest,
    }

    package {'cmake':
        ensure => latest,
    }

    package {'valgrind':
        ensure => latest,
    }

    package {'llvm':
        ensure => latest,
    }
}
