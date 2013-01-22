class python::config {
}

class python::install {
    package {'python':
        ensure => installed,
    }

    package {'python2':
        ensure => installed,
    }
}

class python {
    include python::config, python::install
}
