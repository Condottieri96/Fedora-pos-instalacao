#!/usr/bin/env bash

#--------------PERSOLANALIZAÇÕES------------------------------------------------------#
# mudando para o tema escuro
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

#desabilita "hot-corners" no gnome
gsettings set org.gnome.desktop.interface enable-hot-corners false

#atalho de teclado
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# Keybind 0
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Control><Alt>t"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Terminal"

#----------------------ADD FLATHUB----------------------------------------------------#
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#-------------------INICIO COMANDOS ROOT----------------------------------------------#
sudo -s <<EOF

dnf update -y

# adicionando repositirios
dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
#----------------REMOÇÃO DE PROGRAMAS-------------------------------------------------#
# removendo programas que não utilizo
dnf remove -y \
cheese \
rhythmbox \
totem-video-thumbnailer \
gnome-maps \
gnome-tour \
gnome-boxes \
gnome-photos \
gnome-contacts \
gnome-connections

dnf autoremove -y

#-----------------------INSTALAÇÔES ---------------------------------------------------#

#programas DNF
dnf install -y \
libreoffice-langpack-pt-BR.x86_64 \
vlc \
rclone \
toolbox

# KVM para virtualizações
dnf install -y @virtualization && \
systemctl start libvirtd && \
systemctl enable libvirtd

#programas FLATPAK
flatpak install -y \
com.github.tchx84.Flatseal \
com.obsproject.Studio \
io.typora.Typora \
org.qbittorrent.qBittorrent \
org.remmina.Remmina \
io.github.spacingbat3.webcord \
org.keepassxc.KeePassXC
EOF
#------------------FINAL COMANDOS ROOT------------------------------------------------#
