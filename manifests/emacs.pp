class user::emacs{
  $emacs_src = "https://github.com/${github_user}/emacs.d.git"
  $emacs_dir = "${user::homefolder}/src/emacs.d"
  vcsrepo{ $emacs_dir:
    provider => git,
    source => $emacs_src,
    revision => master,
    require => file["${user::homefolder}/src"]
  }
}
