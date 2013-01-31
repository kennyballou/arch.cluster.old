# == Class: desktop::kde::install
#
# Installation class for KDE
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::kde::install {
    package {'kdebase':
        ensure => latest,
    }

    package {'kdeartwork':
        ensure => latest,
    }
}
