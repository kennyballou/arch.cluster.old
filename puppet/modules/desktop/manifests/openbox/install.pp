class desktop::openbox::install {
    package {'openbox':
        ensure => latest,
    }

    package {'obmenu':
        ensure => latest,
    }

    package {'obconf':
        ensure => latest,
    }

    package {'nitrogen':
        ensure => latest,
    }

    package {'tint2':
        ensure => latest,
    }

    package {'menumaker':
        ensure => latest,
    }
}
