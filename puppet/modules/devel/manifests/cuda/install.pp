import 'python'

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
