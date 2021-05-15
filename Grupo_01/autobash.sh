#!/bin/bash

# shellcheck disable=SC2016

# Caminho da Pasta do Script
DIR_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Importar Ícones dos Programas
source "${DIR_PATH}/src/img/icons.sh"

# Importar Padrões de Widgets
source "${DIR_PATH}/src/widgets.sh"

XML='

<window '"${AUTOBASH_WINDOW_CONFIG}"'>

<notebook '"${NOTEBOOK_CONFIG}"'>

  ###############
  ## Programas ##
  ###############
  <vbox>

    <frame Desenvolvimento>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(button "JetBrains ToolBox" "ToolBox" "${TOOLBOX_ICON}")"'
      '"$(button "Visual Studio" "VSCode" "${VSCODE_ICON}")"'
      '"$(button "Insomnia" "Insomnia" "${INSOMNIA_ICON}")"'
      '"$(button "Beekeeper" "Beekeeper" "${BEEKEEPER_ICON}")"'
      '"$(button "Kubernetes" "Kubernetes" "${KUBERNETES_ICON}")"'
      '"$(button "Docker" "Docker" "${DOCKER_ICON}")"'
      '"$(button "Node JS" "Node JS" "${NODE_ICON}")"'
      '"$(button "React JS" "React JS" "${REACT_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Redes>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(button "Google Cloud SDK" "Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
      '"$(button "TCPdump" "TCPDump" "${TCPDUMP_ICON}")"'
      '"$(button "Wireshark" "Wireshark" "${WIRESHARK_ICON}")"'
      '"$(button "Oracle Virtual Box" "Virtual Box" "${VBOX_ICON}")"'
      '"$(button "VMWare" "VMWare" "${VMWARE_ICON}")"'
      '"$(button "FileZilla" "FileZilla" "${FILEZILLA_ICON}")"'
      '"$(button "Putty" "Putty" "${PUTTY_ICON}")"'
      '"$(button "Remmina" "Remmina" "${REMMINA_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Escritório>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(button "WPS Office" "WPS" "${WPS_ICON}")"'
      '"$(button "Foxit PDF" "Foxit PDF" "${FOXIT_ICON}")"'
      '"$(button "Gimp" "Gimp" "${GIMP_ICON}")"'
      '"$(button "Krita" "Krita" "${KRITA_ICON}")"'
      '"$(button "Inkscape" "Inkscape" "${INKSCAPE_ICON}")"'
      '"$(button "Mailspring" "Mailspring" "${MAILSPRING_ICON}")"'
      '"$(button "Audacity" "Audacity" "${AUDACITY_ICON}")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <hbox>
      <frame Entretenimento>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(button "Spotify" "Spotify" "${SPOTIFY_ICON}")"'
        '"$(button "Skype" "Skype" "${SKYPE_ICON}")"'
        '"$(button "Discord" "Discord" "${DISCORD_ICON}")"'

      </hbox>
      </frame>

      <frame Utilitários>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(button "Wine" "Wine" "${WINE_ICON}")"'
        '"$(button "Chrome" "Chrome" "${CHROME_ICON}")"'
        '"$(button "Brave" "Brave" "${BRAVE_ICON}")"'
        '"$(button "Opera" "Opera" "${OPERA_ICON}")"'
        '"$(button "WinRAR" "WinRAR" "${WINRAR_ICON}")"'

      </hbox>
      </frame>
    </hbox>

  </vbox>

  #############
  ## Pacotes ##
  #############
  <vbox>

    <comboboxtext>
      <variable>PACKAGE</variable>
      <item>Programador</item>
      <item>Redes</item>
      <item>Escritório</item>
    </comboboxtext>

    <frame>
        '"$(tgbutton "JetBrains ToolBox" "JetBrains ToolBox" "${TOOLBOX_ICON}")"'
    </frame>

    '"${GAP}"'

  </vbox>

</notebook>
</window>
'

sed -e "s/##.*//" <<<"${XML}" >/tmp/xml

case $1 in
-d | --dump) echo "$MAIN_DIALOG" ;;
*) gtkdialog --file=/tmp/xml --center 2>/dev/null ;;
esac
