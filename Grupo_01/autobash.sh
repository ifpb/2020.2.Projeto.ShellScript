#!/bin/bash

# shellcheck disable=SC2016

# Caminho da Pasta do Script
DIR_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Importar Ícones dos Programas
source "${DIR_PATH}/src/img/icons.sh"

# Importar Padrões de Widgets
source "${DIR_PATH}/src/widgets.sh"

# Importar Actions
## Widgets
source "${DIR_PATH}/src/actions/widgets.sh"

XML='

<window '"${AUTOBASH_WINDOW_CONFIG}"'>

<notebook '"${NOTEBOOK_CONFIG}"'>

  ###############
  ## Programas ##
  ###############

  <vbox>

    <frame Desenvolvimento>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "JetBrains ToolBox" "ToolBox" "${TOOLBOX_ICON}")"'
      '"$(program_button "Visual Studio" "VSCode" "${VSCODE_ICON}")"'
      '"$(program_button "Insomnia" "Insomnia" "${INSOMNIA_ICON}")"'
      '"$(program_button "Beekeeper" "Beekeeper" "${BEEKEEPER_ICON}")"'
      '"$(program_button "Kubernetes" "Kubernetes" "${KUBERNETES_ICON}")"'
      '"$(program_button "Docker" "Docker" "${DOCKER_ICON}")"'
      '"$(program_button "Node JS" "Node JS" "${NODE_ICON}")"'
      '"$(program_button "React JS" "React JS" "${REACT_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Redes>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "Google Cloud SDK" "Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
      '"$(program_button "TCPdump" "TCPDump" "${TCPDUMP_ICON}")"'
      '"$(program_button "Wireshark" "Wireshark" "${WIRESHARK_ICON}")"'
      '"$(program_button "Oracle Virtual Box" "Virtual Box" "${VBOX_ICON}")"'
      '"$(program_button "VMWare" "VMWare" "${VMWARE_ICON}")"'
      '"$(program_button "FileZilla" "FileZilla" "${FILEZILLA_ICON}")"'
      '"$(program_button "Putty" "Putty" "${PUTTY_ICON}")"'
      '"$(program_button "Remmina" "Remmina" "${REMMINA_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Escritório>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "WPS Office" "WPS" "${WPS_ICON}")"'
      '"$(program_button "Foxit PDF" "Foxit PDF" "${FOXIT_ICON}")"'
      '"$(program_button "Gimp" "Gimp" "${GIMP_ICON}")"'
      '"$(program_button "Krita" "Krita" "${KRITA_ICON}")"'
      '"$(program_button "Inkscape" "Inkscape" "${INKSCAPE_ICON}")"'
      '"$(program_button "Mailspring" "Mailspring" "${MAILSPRING_ICON}")"'
      '"$(program_button "Audacity" "Audacity" "${AUDACITY_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <hbox>
      <frame Lazer>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "Spotify" "Spotify" "${SPOTIFY_ICON}")"'
        '"$(program_button "Skype" "Skype" "${SKYPE_ICON}")"'
        '"$(program_button "Discord" "Discord" "${DISCORD_ICON}")"'

      </hbox>
      </frame>

      <frame Utilitários>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "Wine" "Wine" "${WINE_ICON}")"'
        '"$(program_button "Chrome" "Chrome" "${CHROME_ICON}")"'
        '"$(program_button "Brave" "Brave" "${BRAVE_ICON}")"'
        '"$(program_button "Opera" "Opera" "${OPERA_ICON}")"'
        '"$(program_button "WinRAR" "WinRAR" "${WINRAR_ICON}")"'

      </hbox>
      </frame>
    </hbox>

  </vbox>


  #############
  ## Pacotes ##
  #############
  <vbox>

    <hbox homogeneous="true">

      '"$(package_button "Programador" "PROGRAMADOR_BUTTON" "${PACKAGE_PROGRAMADOR_BUTTON_ACTIONS}")"'
      '"$(package_button "Redes" "REDES_BUTTON" "${PACKAGE_REDES_BUTTON_ACTIONS}")"'
      '"$(package_button "Escritório" "ESCRITORIO_BUTTON" "${PACKAGE_ESCRITORIO_BUTTON_ACTIONS}")"'
      '"$(package_button "Lazer" "LAZER_BUTTON" "${PACKAGE_LAZER_BUTTON_ACTIONS}")"'

    </hbox>

    '"${GAP}"'
    <text><label>"Selecione todos os programas que deseja instalar."</label></text>

    <frame>

        ## PROGRAMADOR
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "JetBrains ToolBox" "${TOOLBOX_ICON}")"'
          '"$(tgbutton "Visual Studio" "${VSCODE_ICON}")"'
          '"$(tgbutton "Insomnia" "${INSOMNIA_ICON}")"'
          '"$(tgbutton "Beekeeper" "${BEEKEEPER_ICON}")"'
          '"$(tgbutton "Kubernetes" "${KUBERNETES_ICON}")"'
          '"$(tgbutton "Docker" "${DOCKER_ICON}")"'
          '"$(tgbutton "Node JS" "${NODE_ICON}")"'
          '"$(tgbutton "React JS" "${REACT_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Chrome" "${CHROME_ICON}")"'
          '"$(tgbutton "Brave" "${BRAVE_ICON}")"'
          '"$(tgbutton "Opera" "${OPERA_ICON}")"'
        <variable>PROGRAMADOR_VBOX</variable> </vbox>

        ## REDES
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "Google Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
          '"$(tgbutton "TCPdump" "${TCPDUMP_ICON}")"'
          '"$(tgbutton "Wireshark" "${WIRESHARK_ICON}")"'
          '"$(tgbutton "Oracle Virtual Box" "${VBOX_ICON}")"'
          '"$(tgbutton "VMWare" "${VMWARE_ICON}")"'
          '"$(tgbutton "FileZilla" "${FILEZILLA_ICON}")"'
          '"$(tgbutton "Putty" "${PUTTY_ICON}")"'
          '"$(tgbutton "Remmina" "${REMMINA_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Brave" "${BRAVE_ICON}")"'
        <variable>REDES_VBOX</variable> </vbox>

        ## ESCRITORIO
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "WPS Office" "${WPS_ICON}")"'
          '"$(tgbutton "Foxit PDF" "${FOXIT_ICON}")"'
          '"$(tgbutton "Gimp" "${GIMP_ICON}")"'
          '"$(tgbutton "Krita" "${KRITA_ICON}")"'
          '"$(tgbutton "Inkscape" "${INKSCAPE_ICON}")"'
          '"$(tgbutton "Mailspring" "${MAILSPRING_ICON}")"'
          '"$(tgbutton "Audacity" "${AUDACITY_ICON}")"'
          '"$(tgbutton "WinRAR" "${WINRAR_ICON}")"'
          '"$(tgbutton "Chrome" "${CHROME_ICON}")"'
        <variable>ESCRITORIO_VBOX</variable> </vbox>

        ## LAZER
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(tgbutton "Spotify" "${SPOTIFY_ICON}")"'
          '"$(tgbutton "Skype" "${SKYPE_ICON}")"'
          '"$(tgbutton "Discord" "${DISCORD_ICON}")"'
        <variable>LAZER_VBOX</variable> </vbox>

    </frame>

    '"${GAP}"'
    <button>
      <label>Instalar</label>
      <action>echo Instalando...[Mentira]</action>
    </button>
    '"${GAP}"'

  </vbox>

</notebook>
</window>
'

sed -e "s/##.*//" <<< "${XML}" > /tmp/xml

case $1 in
-d | --dump) echo "${XML}" ;;
*) gtkdialog --file=/tmp/xml --center 2>/dev/null ;;
esac
