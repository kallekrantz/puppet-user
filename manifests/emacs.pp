class user::emacs{
  $emacs_src = "https://github.com/${user::github_user}/emacs.d.git"
  $emacs_dir = "${user::homefolder}/src/emacs.d"
  vcsrepo{ $emacs_dir:
    ensure => latest,
    provider => git,
    source => $emacs_src,
    revision => master,
    require => File["${user::homefolder}/src"]
  }
  file{ "${user::homefolder}/.emacs.d":
    ensure => link,
    target => $emacs_dir,
    require => Vcsrepo[$emacs_dir],
  }
}
