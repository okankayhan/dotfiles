df_fish_clean() {
  rm -rf ${HOME}/.config/fish
  rm -rf ${HOME}/.config/fisher
}

df_fish_install_fish(){
  #install fish
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt-get update
  sudo apt-get install fish
}

df_fish_install_fisher() {
  #install fisher
  FISHER_URL=https://raw.githubusercontent.com/jorgebucaran/fisher/master/fisher.fish
  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs $FISHER_URL
  ln -sf ${DF_PROJECT_PATH}/fishfile ${HOME}/.config/fish/fishfile
}

df_fish_install_completions() {
  # install kubectl completions
  KUBECTL_COMPLETION_URL=https://raw.githubusercontent.com/evanlucas/fish-kubectl-completions/master/kubectl.fish
  curl -Lo ~/.config/fish/completions/kubectl.fish --create-dirs $KUBECTL_COMPLETION_URL
}

df_fish_install_deps() {
  fish -c "fisher"
  fish -c "fisher add ${DF_PROJECT_PATH}/fish-plugin-nepjua"
}

df_install_fish() {
  if [[ -f ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh ]]; then
    . ${DF_PROJECT_PATH}/fish-plugin-nepjua/config.sh
  fi

  df_fish_clean
  df_fish_install_fish
  df_fish_install_fisher
  df_fish_install_completions
  df_fish_install_deps
}
