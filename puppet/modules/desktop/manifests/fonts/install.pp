class desktop::fonts::install {
    package {'ttf-bitstream-vera':
        ensure => latest,
    }

    package {'ttf-dejavu':
        ensure => latest,
    }

    package {'ttf-droid':
        ensure => latest,
    }

    package {'ttf-freefont':
        ensure => latest,
    }

    package {'ttf-liberation':
        ensure => latest,
    }

    package {'ttf-linux-libertine':
        ensure => latest,
    }

    package {'ttf-ubuntu-font-family':
        ensure => latest,
    }
}
