# == Class: desktop::kde
#
# Installs the KDE desktop environment
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class desktop::kde {
    include desktop::kde::config, desktop::kde::install
}
