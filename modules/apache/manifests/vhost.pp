define apache::vhost(
  $docroot,
  $port,
  $priority,
  $ssl=true,
  $serveraliases = '',
  $template='apache/vhost.conf.erb',
){
  include apache
  
  file { "/etc/httpd/conf.d/${priority}-${name}":
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => 0640,
    require => Class['apache::install'],
    notify  => Class['apache::service'],
  }
}
