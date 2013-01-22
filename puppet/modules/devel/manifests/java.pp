class devel::java::config {
}

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

class devel::java {
    include devel::java::config, devel::java::install
}
