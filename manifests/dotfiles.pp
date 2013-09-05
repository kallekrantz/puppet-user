class user::dotfiles{
  $dotfiles_src = "https://github.com/${github_user}/dotfiles.git"
  $dotfiles_dir = "${user::homefolder}/src/dotfiles"
  vcsrepo{ $dotfiles_dir:
    ensure => latest,
    provider => git,
    source => $dotfiles_src,
    revision => master,
    require => file["${user::homefolder}/src"]
  }
}
