class monit::config(
  $ensure   = 'present',
  $interval = 60,
){
  include monit::install
  include monit::service
  
  file { "monitrc":
    path    => "/etc/monit/monitrc",
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0600,
    content => template("monit/monitrc.erb"),
    require => Class["monit::install"],
    notify  => Class["monit::service"],
  }
}
