class user::shell{
  file{ "${user::homefolder}/bin":
    ensure => directory
  }
  $command = "/bin/curl -sL https://github.com/djl/vcprompt/raw/master/bin/vcprompt > ${user::homefolder}/bin/vcprompt"
  exec{$command:
    creates => "${user::homefolder}/bin/vcprompt",
  }
  $chmodit = "/bin/chmod 755 ${user::homefolder}/bin/vcprompt"
  exec{$chmodit:
    require => Exec[$command]
  }
}
