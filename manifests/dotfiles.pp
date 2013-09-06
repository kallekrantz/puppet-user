class user::dotfiles{
  $dotfiles_src = "https://github.com/${user::github_user}/dotfiles.git"
  $dotfiles_dir = "${user::homefolder}/src/dotfiles"
  vcsrepo{ $dotfiles_dir:
    ensure => latest,
    provider => git,
    source => $dotfiles_src,
    revision => master,
    require => File["${user::homefolder}/src"]
  }
  file{ "${user::homefolder}/.xmonad":
    ensure => directory
  }
  file{ "${user::homefolder}/.xmonad/xmonad.hs":
    ensure => link,
    target => "${dotfiles_dir}/xmonad.hs",
    require => Vcsrepo[$dotfiles_dir]
  }
  file{ "${user::homefolder}/.vimrc":
    ensure => link,
    target => "${dotfiles_dir}/vimrc",
    require => Vcsrepo[$dotfiles_dir]
  }
  file{ "${user::homefolder}/.vim":
    ensure => link,
    target => "${dotfiles_dir}/vim",
    require => Vcsrepo[$dotfiles_dir]
  }
  file{ "${user::homefolder}/config":
    ensure => directory
  }
  file{ "${user::homefolder}/config/fish":
    target => "${dotfiles_dir}/config/fish}",
    force => true,
    ensure => link,
    require => Vcsrepo[$dotfiles_dir]
  }
}
