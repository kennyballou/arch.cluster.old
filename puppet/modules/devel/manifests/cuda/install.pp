import 'python'

# == Class: devel::cuda::install
#
# Installation class for `devel::cuda`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::cuda::install {
    require python

    package {'nvidia':
        ensure => installed,
    }

    package {'cuda':
        ensure => installed,
    }

    package {'python2-pycuda':
        ensure => installed,
    }
}
