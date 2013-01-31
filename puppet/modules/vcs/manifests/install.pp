# == Class: vcs::install
#
# Installation class for `vcs`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class vcs::install {
    package {'git':
        ensure => installed,
    }

    package {'subversion':
        ensure => installed,
    }

    package {'mercurial':
        ensure => installed,
    }
}
