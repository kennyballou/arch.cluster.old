# == Class: devel::java
#
# Installs the Java SDK and JRE
#
# === Authors
#
# Kenny Ballou <kballou@onyx.boisestate.edu>
#
class devel::java {
    include devel::java::config, devel::java::install
}
