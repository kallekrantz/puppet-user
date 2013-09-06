class user{
  $user = "kallekrantz"
  $github_user = "kallekrantz"
  $homefolder = "/home/${user}"
  file{"${homefolder}/src":
    ensure => "directory"
  }
  include user::dotfiles
  include user::emacs
  include user::shell
}
