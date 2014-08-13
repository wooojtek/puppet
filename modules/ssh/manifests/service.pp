class ssh::service {
  include ssh::params
  service { $::ssh::params::ssh_service_name:
    ensure    => running,
    hasstatus => true,
    hasrestrt => true,
    enable    => true,
    require   => Class["ssh::config"],
  }
}
