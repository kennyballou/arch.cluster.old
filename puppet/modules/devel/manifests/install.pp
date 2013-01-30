import 'python'

class devel::install {
    require( Class['python', 'devel::java', 'devel::python', 'devel::cuda'])

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
