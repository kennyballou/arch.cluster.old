import "python"

class devel::python::config {
}

class devel::python::install {
    require( Class['python'])

    package {'python-imaging':
        ensure => installed,
    }

    package {'python2-numpy':
        ensure => installed,
    }

    package {'python2-scipy':
        ensure => installed,
    }

    package {'python-numpy':
        ensure => installed,
    }

    package {'python-scipy':
        ensure => installed,
    }

    package {'ipython':
        ensure => installed,
    }

    package {'ipython2':
        ensure => installed,
    }
}

class devel::python {
    include devel::python::config, devel::python::install
}
