class python::install {
    package {'python':
        ensure => installed,
    }

    package {'python2':
        ensure => installed,
    }
}
