# == Class: desktop::av
#
# Installs packages related to Audio/Visual
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::av {
    include desktop::av::config, desktop::av::install
}
