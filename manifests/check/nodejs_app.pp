define monit::check::nodejs_app(
  $start_script   = "/etc/init.d/$name start",
  $stop_script    = "/etc/init.d/$name stop",
  $port           = 80,
  $protocol       = 'HTTP',
  $server_address = $::fdqn,
  $ensure         = present,
  $url            = '/status/',
){
  include monit::service
  include monit::config

  file { "/etc/monit/conf.d/${title}" :
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("monit/check.erb"),
    require => Class["monit::config"],
    notify  => Class["monit::service"],
  }
}
