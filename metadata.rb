name 'cloudstack'
maintainer 'Ian Duffy'
maintainer_email 'duffy@apache.org'
license 'Apache 2.0'
description 'Installs/Configures cloudstack'
long_description 'Installs/Configures cloudstack'
version '0.0.1'

depends 'mysql'
depends 'co-nfs'
depends 'nat-router'

recipe 'cloudstack::default', 'Installs and Configures services needed by Apache Cloudstack'
recipe 'cloudstack::sys-tmpl', 'Preseeds cloudstack templates'
