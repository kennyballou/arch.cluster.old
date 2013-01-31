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
        ensure => latest,
    }

    package {'nmap':
        ensure => latest,
    }

    package {'tree':
        ensure => latest,
    }

    package {'vim':
        ensure => latest,
    }

    package {'zsh':
        ensure => latest,
    }
}
