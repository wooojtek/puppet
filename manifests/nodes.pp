class base {
  include sudo
  include ssh
}

node 'wb-puppet.changeworks.local' {
  include base
}

node 'wb-web.changeworks.local' {
  include base

  apache::vhost { 'www.example.com':
    port          => '80',
    docroot       => '/var/www/www.example.com',
    ssl           => false,
    priority      => '10',
    serveraliases => 'home.example.com',
  }
}

node 'wb-db.changeworks.local' {
  include base
  include mysql
}

node 'wb-mail.changeworks.local' {
  include base
  include postfix
}
