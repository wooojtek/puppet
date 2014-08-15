class ssh::config {
  include ssh::params
  file { $::ssh::params::ssh_service_config:
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => 0440,
    source  => "puppet:///modules/ssh/files/sshd_config",
    require => Class["ssh::install"],
    notify  => Class["ssh::install"],
  }
}
