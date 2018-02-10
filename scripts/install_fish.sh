#!/bin/bash

PROJECT_ROOT=`pwd`
if [[ -f ${PROJECT_ROOT}/fish-plugin-nepjua/config.sh ]]
then
  . ${PROJECT_ROOT}/fish-plugin-nepjua/config.sh
fi

rm -rf ${HOME}/.config/fish
rm -rf ${HOME}/.config/fisherman
rm -rf ${HOME}/.config/omf
rm -rf ${HOME}/.local/share/omf
rm -rf /tmp/install_omf.fish


# install oh-my-fish
curl -L http://get.oh-my.fish > /tmp/install_omf.fish
chmod +x /tmp/install_omf.fish
/tmp/install_omf.fish --path=${HOME}/.local/share/omf --config=${HOME}/.config/omf --noninteractive --yes
rm -rf ${HOME}/.config/omf
ln -sf ${PROJECT_ROOT}/omf ${HOME}/.config/omf

#install fisherman
FISHER_URL=https://raw.githubusercontent.com/fisherman/fisherman/master/fisher.fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs $FISHER_URL
ln -sf ${PROJECT_ROOT}/fishfile ${HOME}/.config/fish/fishfile

fish -c "fisher"
fish -c "fisher ${PROJECT_ROOT}/fish-plugin-nepjua"
fish -c "omf install"
fish -c "fnm latest"
