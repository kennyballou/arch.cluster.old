import "headless"

class desktop::config {
}

class desktop::install {
    require( Class['headless'])
}

class desktop {
    include desktop::config, desktop::install
}
