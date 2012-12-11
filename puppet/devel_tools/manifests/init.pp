class devel_tools::config {
}

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

class devel_tools {
    include devel_tools::config, devel_tools::install
}
