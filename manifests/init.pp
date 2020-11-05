# == Class onetimesecret
#
# Install, configure and run One-Time Secret
#
class onetimesecret (
  Array $additional_packages,
  String $bundle_exec,
  String $config_dir,
  String $config_file,
  String $config_mode,
  String $config_template,
  String $data_dir,
  Hash $default_options,
  String $domain,
  String $download_url,
  String $group,
  String $host,
  Integer $http_port,
  String $install_dir,
  String $log_dir,
  String $log_file,
  Boolean $manage_additional_packages,
  Boolean $manage_config,
  Boolean $manage_redis,
  Boolean $manage_service,
  Boolean $manage_symlink,
  Boolean $manage_user,
  Hash $options,
  String $path,
  String $pid_dir,
  String $pid_file,
  Hash $redis_options,
  String $redis_password,
  String $secret,
  Boolean $service_enable,
  String $service_ensure,
  Stdlib::Compat::Absolute_path $service_file,
  String $service_name,
  String $service_provider,
  String $service_template,
  String $symlink_name,
  Boolean $use_default_options,
  String $user,
  String $version,
  Optional[Integer] $gid = undef,
  Optional[Integer] $uid = undef,
) {
  include stdlib

  contain onetimesecret::user
  contain onetimesecret::install
  contain onetimesecret::config
  contain onetimesecret::redis
  contain onetimesecret::service

  Class['onetimesecret::user']
  -> Class['onetimesecret::install']
  -> Class['onetimesecret::config']
  -> Class['onetimesecret::redis']
  ~> Class['onetimesecret::service']
}
