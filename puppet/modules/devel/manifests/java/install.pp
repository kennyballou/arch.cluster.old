# == Class: devel::java::install
#
# Installation class for `devel::java`
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::java::install {
    package {'jdk7-openjdk':
        ensure => latest,
    }

    package {'jre7-openjdk-headless':
        ensure => latest,
    }

    package {'jre7-openjdk':
        ensure => latest,
    }
}
