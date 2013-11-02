class monit::install ( 
  $monit  = "monit",
  $ensure = 'installed'
) {
  include monit::service
  
  package { $monit :
    ensure  => $ensure,
    notify  => Class["monit::service"],
  }
}
