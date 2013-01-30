import "headless"

class desktop::install {
    require( Class[
        'headless',
        'desktop::av',
        'desktop::fonts',
        'desktop::kde',
        'desktop::openbox'])

    package {'chromium':
        ensure => latest,
    }

    package {'conky':
        ensure => latest,
    }

    package {'cups':
        ensure => latest,
    }

    package {'cups-pdf':
        ensure => latest,
    }

    package {'dmenu':
        ensure => latest,
    }

    package {'eclipse':
        ensure => latest,
    }

    package {'gimp':
        ensure => latest,
    }

    package {'gnome-icon-theme':
        ensure => latest,
    }

    package {'gnome-themes-extra':
        ensure => latest,
    }

    package {'gnome-themes-standard':
        ensure => latest,
    }

    package {'gvfs':
        ensure => latest,
    }

    package {'inkspace':
        ensure => latest,
    }

    package {'libreoffice':
        ensure => latest,
    }

    package {'libreoffice-en-US':
        ensure => latest,
    }

    package {'opera':
        ensure => latest,
    }

    package {'pango':
        ensure => latest,
    }

    package {'pcmanfm':
        ensure => latest,
    }

    package {'pidgin':
        ensure => latest,
    }

    package {'tangerine-icon-theme':
        ensure => latest,
    }

    package {'terminator':
        ensure => latest,
    }

    package {'xchat':
        ensure => latest,
    }
}
