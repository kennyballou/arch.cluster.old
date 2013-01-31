import 'python'
import 'vcs'
import 'devel'
import 'devel_tools'

# == Class: headless::install
#
# Installation for `headless` class
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class headless::install {
    require python, vcs, devel, devel_tools

    package {'dnsutils':
        ensure => installed,
    }

    package {'nmap':
        ensure => installed,
    }

    package {'tree':
        ensure => installed,
    }

    package {'vim':
        ensure => installed,
    }

    package {'zsh':
        ensure => installed,
    }
}
