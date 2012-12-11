class cuda::config {
}

class cuda::install {
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

class cuda {
    include cuda::config, cuda::install
}
