# == Class: profile::nginx
#
#
class profile::nginx (
  $nginx_hosts   = {},
  $nginx_service = running,
){
  class { '::nginx':
    service_ensure => $nginx_service,
  }

  include ::consul
  include ::consul_template

  if $nginx_hosts != undef {
    validate_hash($nginx_hosts)
    create_resources(common::host,$nginx_hosts)
  }

}
