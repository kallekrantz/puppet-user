class user::dotfiles{
  $dotfiles_src = "https://github.com/${github_user}/dotfiles.git"
  $dotfiles_dir = "${user::homefolder}/src/dotfiles"
  vcsrepo{ $dotfiles_dir:
    provider => git,
    source => $dotfiles_src,
    revision => master,
    require => file["${user::homefolder}/src"]
  }
}
