# == Class: devel::cuda
#
# Installs nVidia's CUDA SDK and required packages
# Also Installs pycuda
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::cuda {
    include devel::cuda::config, devel::cuda::install
}
