import "headless"
import "desktop"
import "cuda"

node "headless" {
    include headless
}

node "cuda" {
    include headless, cuda
}

node "desktop" {
    include desktop, cuda
}
