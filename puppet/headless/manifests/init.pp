import "python"
import "vcs"
import "cuda"

class headless::config {
}

class headless::install {
    require( Class['python', 'vcs', 'cuda'])

    package {'boost':
        ensure => installed,
    }

    package {'boost-libs':
        ensure => installed,
    }

    package {'clang':
        ensure => installed,
    }

    package {'cmake':
        ensure => installed,
    }

    package {'dmd':
        ensure => installed,
    }

    package {'dnsutils':
        ensure => installed,
    }

    package {'gdb':
        ensure => installed,
    }

    package {'go':
        ensure => installed,
    }

    package {'jdk7-openjdk':
        ensure => installed,
    }

    package {'jdk7-openjdk-headless':
        ensure => installed,
    }

    package {'llvm':
        ensure => installed,
    }

    package {'nmap':
        ensure => installed,
    }

    package {'tree':
        ensure => installed,
    }

    package {'valgrind':
        ensure => installed,
    }

    package {'vim':
        ensure => installed,
    }

    package {'zeromq':
        ensure => installed,
    }

    package {'zsh':
        ensure => installed,
    }
}

class headless {
    include headless::config, headless::install
}
