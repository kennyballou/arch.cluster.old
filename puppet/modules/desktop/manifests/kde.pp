class desktop::kde::config {
}

class desktop::kde::install {
    package {'kdebase':
        ensure => latest,
    }

    package {'kdeartwork':
        ensure => latest,
    }
}

class desktop::kde {
    include desktop::kde::config, desktop::kde::install
}
