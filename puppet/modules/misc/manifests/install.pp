class misc::install {
    package {'dnsutils':
        ensure => latest,
    }

    package {'nmap':
        ensure => latest,
    }

    package {'tree':
        ensure => latest,
    }

    package {'zsh':
        ensure => latest,
    }
}
