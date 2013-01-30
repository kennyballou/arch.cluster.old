class desktop::kde::install {
    package {'kdebase':
        ensure => latest,
    }

    package {'kdeartwork':
        ensure => latest,
    }
}
