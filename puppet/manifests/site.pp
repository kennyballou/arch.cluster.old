import 'headless'
import 'desktop'

node 'headless-node' {
    include headless
}

node 'desktop-node' {
    include desktop
}

node 'node12.viz' inherits headless-node {
}

node 'node24.viz' inherits desktop-node {
}
