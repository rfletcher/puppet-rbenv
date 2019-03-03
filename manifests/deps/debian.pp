# == Class: rbenv::deps::debian
#
# This module manages rbenv dependencies for Debian $::osfamily.
#
class rbenv::deps::debian {
  if ! defined(Package['build-essential']) {
    package { 'build-essential': ensure => installed }
  }

  case $::lsbdistcodename {
    'bionic': {
      $libreadline_package_name = 'libreadline-dev'
    }
    default: {
      $libreadline_package_name = 'libreadline6-dev'
    }
  }

  if ! defined(Package[$libreadline_package_name]) {
    package { $libreadline_package_name: ensure => installed }
  }

  if ! defined(Package['libssl-dev']) {
    package { 'libssl-dev': ensure => installed }
  }

  if ! defined(Package['pkg-config']) {
    package { 'pkg-config': ensure => installed }
  }

  if ! defined(Package['zlib1g-dev']) {
    package { 'zlib1g-dev': ensure => installed }
  }
}
