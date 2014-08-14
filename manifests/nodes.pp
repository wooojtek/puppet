class base {
  include sudo
  include ssh
  include puppet
}

node 'puppet.wb.local' {
  include base
  include puppet::master
}

node 'web.wb.local' {
  include base

  apache::vhost { 'www.wb.local':
    port          => '80',
    docroot       => '/var/www/www.wb.local',
    ssl           => false,
    priority      => '10',
    serveraliases => 'home.wb.local',
  }
}

node 'db.wb.local' {
  include base
  include mysql
}

node 'mail.wb.local' {
  include base
  include postfix
}