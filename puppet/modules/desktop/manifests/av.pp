class desktop::av::config {
}

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

class desktop::av {
    include desktop::av::config, desktop::av::install
}
