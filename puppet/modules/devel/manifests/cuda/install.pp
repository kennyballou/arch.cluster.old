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
        ensure => latest,
    }

    package {'cuda':
        ensure => latest,
    }

    package {'python2-pycuda':
        ensure => latest,
    }
}
