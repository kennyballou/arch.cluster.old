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
