class monit::service {
  include monit::config
  service { "monit":
    ensure      => running,
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class["monit::install"],
  }
}
