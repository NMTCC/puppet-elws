class profiles::sensu {
  $rabbitmq_port            = 5671
  $rabbitmq_password        = hiera(dbpasswd)
  $rabbitmq_host            = 'mqhost.nmt.edu'
  $subscriptions            = ['fedora',]
  $repo_source              = 'http://repos.sensuapp.org/yum/el/6/$basearch/'
  $rabbitmq_ssl_private_key = 'puppet:///files/sensu/ssl/key.pem'
  $rabbitmq_ssl_cert_chain  = 'puppet:///files/sensu/ssl/cert.pem'

  package { 'sensu-gem':
    ensure    => 'latest',
    provider  => 'gem',
    name      => 'sensu-plugin',
  }
}