#!/bin/bash
# shellcheck disable=SC2089
# shellcheck disable=SC2016

# 1 - Name | 2 - Image | 3 - Website | 4 - Installation Process | 5 - Var Name | 6 - Button Name
function install_popup() {
  POPUP='
          <window title="AutoBASH" icon-name="gtk-goto-bottom" resizable="false" width-request="448">
          <vbox>
            <text><label>Deseja instalar '"${1}"'?</label></text>
            <pixmap> <height>64</height> <width>64</width>
            <input file>'"${2}"'</input></pixmap>
            <hbox homogeneous="true">
              <button>
                <label>Cancelar</label>
                <action type="enable">'"${6}"'</action>
                <action type="closewindow">'"${5}"'</action>
              </button>
              <button>
                <label>Website</label>
                <action>"xdg-open '"${3}"'"</action>
              </button>
              <button image-position="1">
                <variable>'"${5}"'_POPUP</variable>
                <label>Instalar</label>
                <input file icon="bottom"></input>
                <action type="disable">'"${5}"'_POPUP</action>
                <action>'"${4}"'</action>
                <action>echo '"${1}"' Instalado.</action>
              </button>
            </hbox>
          </vbox>
          <variable>'"${5}"'</variable></window>
          '

  echo "${POPUP}"
}

# Pop-ups dos programas
## Desenvolvimento
export INSTALL_TOOLBOX_POPUP=$(install_popup "JetBrains ToolBox" "${TOOLBOX_ICON}" "https://www.jetbrains.com/pt-br/toolbox-app/" "${INSTALL_TOOLBOX}" "INSTALL_TOOLBOX" "TOOLBOX_BUTTON")
export INSTALL_VSCODE_POPUP=$(install_popup "Visual Studio" "${VSCODE_ICON}" "https://code.visualstudio.com/" "${INSTALL_VSCODE}" "INSTALL_VSCODE" "VSCODE_BUTTON")
export INSTALL_INSOMNIA_POPUP=$(install_popup "Insomnia" "${INSOMNIA_ICON}" "https://insomnia.rest/" "${INSTALL_INSOMNIA}" "INSTALL_INSOMNIA" "INSOMNIA_BUTTON")
export INSTALL_BEEKEEPER_POPUP=$(install_popup "Beekeeper" "${BEEKEEPER_ICON}" "https://www.beekeeperstudio.io/" "${INSTALL_BEEKEEPER}" "INSTALL_BEEKEEPER" "BEEKEEPER_BUTTON")
export INSTALL_KUBERNETES_POPUP=$(install_popup "Kubernetes" "${KUBERNETES_ICON}" "https://kubernetes.io/" "${INSTALL_KUBERNETES}" "INSTALL_KUBERNETES" "KUBERNETES_BUTTON")
export INSTALL_DOCKER_POPUP=$(install_popup "Docker" "${DOCKER_ICON}" "https://www.docker.com/" "${INSTALL_DOCKER}" "INSTALL_DOCKER" "DOCKER_BUTTON")
export INSTALL_NODE_POPUP=$(install_popup "Node JS" "${NODE_ICON}" "https://nodejs.org/" "${INSTALL_NODE}" "INSTALL_NODE" "NODE_BUTTON")
export INSTALL_REACT_POPUP=$(install_popup "React JS" "${REACT_ICON}" "https://pt-br.reactjs.org/" "${INSTALL_REACT}" "INSTALL_REACT" "REACT_BUTTON")

## Redes
export INSTALL_GOOGLE_CSDK_POPUP=$(install_popup "Google Cloud SDK" "${GOOGLE_CSDK_ICON}" "https://cloud.google.com/sdk" "${INSTALL_GOOGLE_CSDK}" "INSTALL_GOOGLE_CSDK" "GOOGLE_CSDK_BUTTON")
export INSTALL_TCPDUMP_POPUP=$(install_popup "TCPdump" "${TCPDUMP_ICON}" "https://www.tcpdump.org/" "${INSTALL_TCPDUMP}" "INSTALL_TCPDUMP" "TCPDUMP_BUTTON")
export INSTALL_WIRESHARK_POPUP=$(install_popup "Wireshark" "${WIRESHARK_ICON}" "https://www.wireshark.org/" "${INSTALL_WIRESHARK}" "INSTALL_WIRESHARK" "WIRESHARK_BUTTON")
export INSTALL_VBOX_POPUP=$(install_popup "Oracle Virtual Box" "${VBOX_ICON}" "https://www.virtualbox.org/" "${INSTALL_VBOX}" "INSTALL_VBOX" "VBOX_BUTTON")
export INSTALL_VMWARE_POPUP=$(install_popup "VMWare" "${VMWARE_ICON}" "https://www.vmware.com/" "${INSTALL_VMWARE}" "INSTALL_VMWARE" "VMWARE_BUTTON")
export INSTALL_FILEZILLA_POPUP=$(install_popup "FileZilla" "${FILEZILLA_ICON}" "https://filezilla-project.org/" "${INSTALL_FILEZILLA}" "INSTALL_FILEZILLA" "FILEZILLA_BUTTON")
export INSTALL_PUTTY_POPUP=$(install_popup "Putty" "${PUTTY_ICON}" "https://www.putty.org/" "${INSTALL_PUTTY}" "INSTALL_PUTTY" "PUTTY_BUTTON")
export INSTALL_REMMINA_POPUP=$(install_popup "Remmina" "${REMMINA_ICON}" "https://remmina.org/" "${INSTALL_REMMINA}" "INSTALL_REMMINA" "REMMINA_BUTTON")

## Lazer
export INSTALL_SPOTIFY_POPUP=$(install_popup "Spotify" "${SPOTIFY_ICON}" "https://www.spotify.com/" "${INSTALL_SPOTIFY}" "INSTALL_SPOTIFY" "SPOTIFY_BUTTON")
export INSTALL_SKYPE_POPUP=$(install_popup "Skype" "${SKYPE_ICON}" "https://www.skype.com/" "${INSTALL_SKYPE}" "INSTALL_SKYPE" "SKYPE_BUTTON")
export INSTALL_DISCORD_POPUP=$(install_popup "Discord" "${DISCORD_ICON}" "https://discord.com/" "${INSTALL_DISCORD}" "INSTALL_DISCORD" "DISCORD_BUTTON")

## Utilitários
export INSTALL_WINE_POPUP=$(install_popup "Wine" "${WINE_ICON}" "https://www.winehq.org/" "${INSTALL_WINE}" "INSTALL_WINE" "WINE_BUTTON")
export INSTALL_CHROME_POPUP=$(install_popup "Chrome" "${CHROME_ICON}" "https://www.google.com/intl/pt-BR/chrome/" "${INSTALL_CHROME}" "INSTALL_CHROME" "CHROME_BUTTON")
export INSTALL_BRAVE_POPUP=$(install_popup "Brave" "${BRAVE_ICON}" "https://brave.com/" "${INSTALL_BRAVE}" "INSTALL_BRAVE" "BRAVE_BUTTON")
export INSTALL_OPERA_POPUP=$(install_popup "Opera" "${OPERA_ICON}" "https://www.opera.com/" "${INSTALL_OPERA}" "INSTALL_OPERA" "OPERA_BUTTON")
export INSTALL_WINRAR_POPUP=$(install_popup "WinRAR" "${WINRAR_ICON}" "https://www.win-rar.com/" "${INSTALL_WINRAR}" "INSTALL_WINRAR" "WINRAR_BUTTON")

## Escritório
export INSTALL_WPS_POPUP=$(install_popup "WPS Office" "${WPS_ICON}" "https://www.wps.com/" "${INSTALL_WPS}" "INSTALL_WPS" "WPS_BUTTON")
export INSTALL_FOXIT_POPUP=$(install_popup "Foxit PDF" "${FOXIT_ICON}" "https://www.foxitsoftware.com/pdf-reader/" "${INSTALL_FOXIT}" "INSTALL_FOXIT" "FOXIT_BUTTON")
export INSTALL_GIMP_POPUP=$(install_popup "Gimp" "${GIMP_ICON}" "https://www.gimp.org/" "${INSTALL_GIMP}" "INSTALL_GIMP" "GIMP_BUTTON")
export INSTALL_KRITA_POPUP=$(install_popup "Krita" "${KRITA_ICON}" "https://krita.org/" "${INSTALL_KRITA}" "INSTALL_KRITA" "KRITA_BUTTON")
export INSTALL_INKSCAPE_POPUP=$(install_popup "Inkscape" "${INKSCAPE_ICON}" "https://inkscape.org/" "${INSTALL_INKSCAPE}" "INSTALL_INKSCAPE" "INKSCAPE_BUTTON")
export INSTALL_MAILSPRING_POPUP=$(install_popup "Mailspring" "${MAILSPRING_ICON}" "https://getmailspring.com/" "${INSTALL_MAILSPRING}" "INSTALL_MAILSPRING" "MAILSPRING_BUTTON")
export INSTALL_AUDACITY_POPUP=$(install_popup "Audacity" "${AUDACITY_ICON}" "https://www.audacityteam.org/" "${INSTALL_AUDACITY}" "INSTALL_AUDACITY" "AUDACITY_BUTTON")
