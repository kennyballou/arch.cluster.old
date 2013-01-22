class vcs::config {
}

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

class vcs {
    include vcs::config, vcs::install
}
