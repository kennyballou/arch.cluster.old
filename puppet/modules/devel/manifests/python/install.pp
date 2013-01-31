import 'python'

# == Class devel::python::install
#
# Installation class for `devel::python`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::python::install {
    require python

    package {'python-imaging':
        ensure => latest,
    }

    package {'python2-numpy':
        ensure => latest,
    }

    package {'python2-scipy':
        ensure => latest,
    }

    package {'python-numpy':
        ensure => latest,
    }

    package {'python-scipy':
        ensure => latest,
    }

    package {'ipython':
        ensure => latest,
    }

    package {'ipython2':
        ensure => latest,
    }
}
