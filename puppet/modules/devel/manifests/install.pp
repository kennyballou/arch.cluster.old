import 'python'

# == Class: devel::install
#
# Installation class for `devel`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::install {
    require python, devel::java, devel::python, devel::cuda

    package {'boost':
        ensure => latest,
    }

    package {'boost-libs':
        ensure => latest,
    }

    package {'clang':
        ensure => latest,
    }

    package {'go':
        ensure => latest,
    }

    package {'zeromq':
        ensure => latest,
    }
}
