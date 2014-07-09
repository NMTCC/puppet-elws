class profiles::sensu {
  package { 'sensu-gem':
    ensure    => 'latest',
    provider  => 'gem',
    name      => 'sensu-plugin',
  } ->
}