#!/bin/bash

# Pop-ups dos programas
## Desenvolvimento
export INSTALL_TOOLBOX=$(install_popup "JetBrains ToolBox" "${TOOLBOX_ICON}" "https://www.jetbrains.com/pt-br/toolbox-app/" "echo 'Instalando...[Mentira]'" "INSTALL_TOOLBOX" "TOOLBOX_BUTTON")
export INSTALL_VSCODE=$(install_popup "Visual Studio" "${VSCODE_ICON}" "https://code.visualstudio.com/" "echo 'Instalando...[Mentira]'" "INSTALL_VSCODE" "VSCODE_BUTTON")
export INSTALL_INSOMNIA=$(install_popup "Insomnia" "${INSOMNIA_ICON}" "https://insomnia.rest/" "echo 'Instalando...[Mentira]'" "INSTALL_INSOMNIA" "INSOMNIA_BUTTON")
export INSTALL_BEEKEEPER=$(install_popup "Beekeeper" "${BEEKEEPER_ICON}" "https://www.beekeeperstudio.io/" "echo 'Instalando...[Mentira]'" "INSTALL_BEEKEEPER" "BEEKEEPER_BUTTON")
export INSTALL_KUBERNETES=$(install_popup "Kubernetes" "${KUBERNETES_ICON}" "https://kubernetes.io/" "echo 'Instalando...[Mentira]'" "INSTALL_KUBERNETES" "KUBERNETES_BUTTON")
export INSTALL_DOCKER=$(install_popup "Docker" "${DOCKER_ICON}" "https://www.docker.com/" "echo 'Instalando...[Mentira]'" "INSTALL_DOCKER" "DOCKER_BUTTON")
export INSTALL_NODE=$(install_popup "Node JS" "${NODE_ICON}" "https://nodejs.org/" "echo 'Instalando...[Mentira]'" "INSTALL_NODE" "NODE_BUTTON")
export INSTALL_REACT=$(install_popup "React JS" "${REACT_ICON}" "https://pt-br.reactjs.org/" "echo 'Instalando...[Mentira]'" "INSTALL_REACT" "REACT_BUTTON")

## Redes
export INSTALL_GOOGLE_CSDK=$(install_popup "Google Cloud SDK" "${GOOGLE_CSDK_ICON}" "https://cloud.google.com/sdk" "echo 'Instalando...[Mentira]'" "INSTALL_GOOGLE_CSDK" "GOOGLE_CSDK_BUTTON")
export INSTALL_TCPDUMP=$(install_popup "TCPdump" "${TCPDUMP_ICON}" "https://www.tcpdump.org/" "echo 'Instalando...[Mentira]'" "INSTALL_TCPDUMP" "TCPDUMP_BUTTON")
export INSTALL_WIRESHARK=$(install_popup "Wireshark" "${WIRESHARK_ICON}" "https://www.wireshark.org/" "echo 'Instalando...[Mentira]'" "INSTALL_WIRESHARK" "WIRESHARK_BUTTON")
export INSTALL_VBOX=$(install_popup "Oracle Virtual Box" "${VBOX_ICON}" "https://www.virtualbox.org/" "echo 'Instalando...[Mentira]'" "INSTALL_VBOX" "VBOX_BUTTON")
export INSTALL_VMWARE=$(install_popup "VMWare" "${VMWARE_ICON}" "https://www.vmware.com/" "echo 'Instalando...[Mentira]'" "INSTALL_VMWARE" "VMWARE_BUTTON")
export INSTALL_FILEZILLA=$(install_popup "FileZilla" "${FILEZILLA_ICON}" "https://filezilla-project.org/" "echo 'Instalando...[Mentira]'" "INSTALL_FILEZILLA" "FILEZILLA_BUTTON")
export INSTALL_PUTTY=$(install_popup "Putty" "${PUTTY_ICON}" "https://www.putty.org/" "echo 'Instalando...[Mentira]'" "INSTALL_PUTTY" "PUTTY_BUTTON")
export INSTALL_REMMINA=$(install_popup "Remmina" "${REMMINA_ICON}" "https://remmina.org/" "echo 'Instalando...[Mentira]'" "INSTALL_REMMINA" "REMMINA_BUTTON")

## Lazer
export INSTALL_SPOTIFY=$(install_popup "Spotify" "${SPOTIFY_ICON}" "https://www.spotify.com/" "echo 'Instalando...[Mentira]'" "INSTALL_SPOTIFY" "SPOTIFY_BUTTON")
export INSTALL_SKYPE=$(install_popup "Skype" "${SKYPE_ICON}" "https://www.skype.com/" "echo 'Instalando...[Mentira]'" "INSTALL_SKYPE" "SKYPE_BUTTON")
export INSTALL_DISCORD=$(install_popup "Discord" "${DISCORD_ICON}" "https://discord.com/" "echo 'Instalando...[Mentira]'" "INSTALL_DISCORD" "DISCORD_BUTTON")

## Utilitários
export INSTALL_WINE=$(install_popup "Wine" "${WINE_ICON}" "https://www.winehq.org/" "echo 'Instalando...[Mentira]'" "INSTALL_WINE" "WINE_BUTTON")
export INSTALL_CHROME=$(install_popup "Chrome" "${CHROME_ICON}" "https://www.google.com/intl/pt-BR/chrome/" "echo 'Instalando...[Mentira]'" "INSTALL_CHROME" "CHROME_BUTTON")
export INSTALL_BRAVE=$(install_popup "Brave" "${BRAVE_ICON}" "https://brave.com/" "echo 'Instalando...[Mentira]'" "INSTALL_BRAVE" "BRAVE_BUTTON")
export INSTALL_OPERA=$(install_popup "Opera" "${OPERA_ICON}" "https://www.opera.com/" "echo 'Instalando...[Mentira]'" "INSTALL_OPERA" "OPERA_BUTTON")
export INSTALL_WINRAR=$(install_popup "WinRAR" "${WINRAR_ICON}" "https://www.win-rar.com/" "echo 'Instalando...[Mentira]'" "INSTALL_WINRAR" "WINRAR_BUTTON")

## Escritório
export INSTALL_WPS=$(install_popup "WPS Office" "${WPS_ICON}" "https://www.wps.com/" "echo 'Instalando...[Mentira]'" "INSTALL_WPS" "WPS_BUTTON")
export INSTALL_FOXIT=$(install_popup "Foxit PDF" "${FOXIT_ICON}" "https://www.foxitsoftware.com/pdf-reader/" "echo 'Instalando...[Mentira]'" "INSTALL_FOXIT" "FOXIT_BUTTON")
export INSTALL_GIMP=$(install_popup "Gimp" "${GIMP_ICON}" "https://www.gimp.org/" "echo 'Instalando...[Mentira]'" "INSTALL_GIMP" "GIMP_BUTTON")
export INSTALL_KRITA=$(install_popup "Krita" "${KRITA_ICON}" "https://krita.org/" "echo 'Instalando...[Mentira]'" "INSTALL_KRITA" "KRITA_BUTTON")
export INSTALL_INKSCAPE=$(install_popup "Inkscape" "${INKSCAPE_ICON}" "https://inkscape.org/" "echo 'Instalando...[Mentira]'" "INSTALL_INKSCAPE" "INKSCAPE_BUTTON")
export INSTALL_MAILSPRING=$(install_popup "Mailspring" "${MAILSPRING_ICON}" "https://getmailspring.com/" "echo 'Instalando...[Mentira]'" "INSTALL_MAILSPRING" "MAILSPRING_BUTTON")
export INSTALL_AUDACITY=$(install_popup "Audacity" "${AUDACITY_ICON}" "https://www.audacityteam.org/" "echo 'Instalando...[Mentira]'" "INSTALL_AUDACITY" "AUDACITY_BUTTON")
