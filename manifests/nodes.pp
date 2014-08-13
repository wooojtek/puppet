class base {
  include sudo
  include ssh
}

node 'wb-puppet.changeworks.local' {
  include base
}

node 'wb-web.changeworks.local' {
  include base
}

node 'wb-db.changeworks.local' {
  include base
}

node 'wb-mail.changeworks.local' {
  include base
  include postfix
}
