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
        ensure => latest,
    }

    package {'subversion':
        ensure => latest,
    }

    package {'mercurial':
        ensure => latest,
    }
}
