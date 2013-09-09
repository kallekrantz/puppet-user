class user::dotfiles{
  $dotfiles_src = "https://github.com/${user::github_user}/dotfiles.git"
  $dotfiles_dir = "${user::homefolder}/src/dotfiles"
  vcsrepo{ $dotfiles_dir:
    ensure => latest,
    provider => git,
    source => $dotfiles_src,
    revision => master,
    owner => 'kallekrantz',
    group => 'kallekrantz',
    require => File["${user::homefolder}/src"]
  }
  file{ "${user::homefolder}/.xmonad":
    ensure => directory,
    owner => 'kallekrantz',
    group => 'kallekrantz',
  }
  file{ "${user::homefolder}/.xmonad/xmonad.hs":
    ensure => link,
    target => "${dotfiles_dir}/xmonad.hs",
    owner => 'kallekrantz',
    group => 'kallekrantz',
    require => Vcsrepo[$dotfiles_dir],
  }
  file{ "${user::homefolder}/.vimrc":
    ensure => link,
    target => "${dotfiles_dir}/vimrc",
    owner => 'kallekrantz',
    group => 'kallekrantz',
    require => Vcsrepo[$dotfiles_dir]
  }
  file{ "${user::homefolder}/.vim":
    ensure => link,
    target => "${dotfiles_dir}/vim",
    owner => 'kallekrantz',
    group => 'kallekrantz',
    require => Vcsrepo[$dotfiles_dir]
  }
  file{ "${user::homefolder}/config":
    ensure => directory,
    owner => 'kallekrantz',
    group => 'kallekrantz',
  }
  file{ "${user::homefolder}/config/fish":
    target => "${dotfiles_dir}/config/fish}",
    force => true,
    ensure => link,
    owner => 'kallekrantz',
    group => 'kallekrantz',
    require => Vcsrepo[$dotfiles_dir]
  }
}
