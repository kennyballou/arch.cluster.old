# == Class: desktop::av::install
#
# Installation class for `desktop::av`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::av::install {
    package {'alsa-lib':
        ensure => latest,
    }

    package {'alsa-utils':
        ensure => latest,
    }

    package {'gstreamer0.10':
        ensure => latest,
    }

    package {'gstreamer0.10-plugins':
        ensure => latest,
    }

    package {'phonon-gstreamer':
        ensure => latest,
    }

    package {'volumeicon':
        ensure => latest,
    }

    package {'ffmpeg':
        ensure => latest,
    }

    package {'flashplugin':
        ensure => latest,
    }
}
