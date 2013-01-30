class devel_tools::install {
    package {'gdb':
        ensure => latest,
    }

    package {'dmd':
        ensure => latest,
    }

    package {'cmake':
        ensure => latest,
    }

    package {'valgrind':
        ensure => latest,
    }

    package {'llvm':
        ensure => latest,
    }
}
