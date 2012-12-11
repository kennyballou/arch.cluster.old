import "python"

class devel::cuda::config {
}

class devel::cuda::install {
    require( Class['python'])

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

class devel::cuda {
    include devel::cuda::config, devel::cuda::install
}
