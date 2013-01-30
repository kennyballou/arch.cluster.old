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
