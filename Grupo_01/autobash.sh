#!/bin/bash
# shellcheck disable=SC2016
# shellcheck disable=SC2001

# Caminho da Pasta do Script
export DIR_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Configuração Inicial
source "${DIR_PATH}/src/config.sh"

# Importar Ícones dos Programas
source "${DIR_PATH}/src/img/icons.sh"

# Importar Padrões de Widgets
source "${DIR_PATH}/src/widgets.sh"

# Importar Actions
## Programs
source "${DIR_PATH}/src/actions/programs.sh"
## Pop-ups
source "${DIR_PATH}/src/actions/popups.sh"
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

      '"$(program_button "TOOLBOX_BUTTON" "JetBrains ToolBox" "ToolBox" "${TOOLBOX_ICON}" "INSTALL_TOOLBOX_POPUP")"'
      '"$(program_button "VSCODE_BUTTON" "Visual Studio" "VSCode" "${VSCODE_ICON}" "INSTALL_VSCODE_POPUP")"'
      '"$(program_button "INSOMNIA_BUTTON" "Insomnia" "Insomnia" "${INSOMNIA_ICON}" "INSTALL_INSOMNIA_POPUP")"'
      '"$(program_button "BEEKEEPER_BUTTON" "Beekeeper" "Beekeeper" "${BEEKEEPER_ICON}" "INSTALL_BEEKEEPER_POPUP")"'
      '"$(program_button "KUBERNETES_BUTTON" "Kubernetes" "Kubernetes" "${KUBERNETES_ICON}" "INSTALL_KUBERNETES_POPUP")"'
      '"$(program_button "DOCKER_BUTTON" "Docker" "Docker" "${DOCKER_ICON}" "INSTALL_DOCKER_POPUP")"'
      '"$(program_button "NODE_BUTTON" "Node JS" "Node JS" "${NODE_ICON}" "INSTALL_NODE_POPUP")"'
      '"$(program_button "REACT_BUTTON" "React JS" "React JS" "${REACT_ICON}" "INSTALL_REACT_POPUP")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Redes>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "GOOGLE_CSDK_BUTTON" "Google Cloud SDK" "Cloud SDK" "${GOOGLE_CSDK_ICON}" "INSTALL_GOOGLE_CSDK_POPUP")"'
      '"$(program_button "TCPDUMP_BUTTON" "TCPdump" "TCPDump" "${TCPDUMP_ICON}" "INSTALL_TCPDUMP_POPUP")"'
      '"$(program_button "WIRESHARK_BUTTON" "Wireshark" "Wireshark" "${WIRESHARK_ICON}" "INSTALL_WIRESHARK_POPUP")"'
      '"$(program_button "VBOX_BUTTON" "Oracle Virtual Box" "Virtual Box" "${VBOX_ICON}" "INSTALL_VBOX_POPUP")"'
      '"$(program_button "VMWARE_BUTTON" "VMWare" "VMWare" "${VMWARE_ICON}" "INSTALL_VMWARE_POPUP")"'
      '"$(program_button "FILEZILLA_BUTTON" "FileZilla" "FileZilla" "${FILEZILLA_ICON}" "INSTALL_FILEZILLA_POPUP")"'
      '"$(program_button "PUTTY_BUTTON" "Putty" "Putty" "${PUTTY_ICON}" "INSTALL_PUTTY_POPUP")"'
      '"$(program_button "REMMINA_BUTTON" "Remmina" "Remmina" "${REMMINA_ICON}" "INSTALL_REMMINA_POPUP")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <frame Escritório>
    <hbox '"${FRAME_HBOX_CONFIG}"'>

      '"$(program_button "WPS_BUTTON" "WPS Office" "WPS" "${WPS_ICON}" "INSTALL_WPS_POPUP")"'
      '"$(program_button "FOXIT_BUTTON" "Foxit PDF" "Foxit PDF" "${FOXIT_ICON}" "INSTALL_FOXIT_POPUP")"'
      '"$(program_button "GIMP_BUTTON" "Gimp" "Gimp" "${GIMP_ICON}" "INSTALL_GIMP_POPUP")"'
      '"$(program_button "KRITA_BUTTON" "Krita" "Krita" "${KRITA_ICON}" "INSTALL_KRITA_POPUP")"'
      '"$(program_button "INKSCAPE_BUTTON" "Inkscape" "Inkscape" "${INKSCAPE_ICON}" "INSTALL_INKSCAPE_POPUP")"'
      '"$(program_button "MAILSPRING_BUTTON" "Mailspring" "Mailspring" "${MAILSPRING_ICON}" "INSTALL_MAILSPRING_POPUP")"'
      '"$(program_button "AUDACITY_BUTTON" "Audacity" "Audacity" "${AUDACITY_ICON}" "INSTALL_AUDACITY_POPUP")"'

    </hbox>
    </frame>

    '"${GAP}"'

    <hbox>
      <frame Lazer>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "SPOTIFY_BUTTON" "Spotify" "Spotify" "${SPOTIFY_ICON}" "INSTALL_SPOTIFY_POPUP")"'
        '"$(program_button "SKYPE_BUTTON" "Skype" "Skype" "${SKYPE_ICON}" "INSTALL_SKYPE_POPUP")"'
        '"$(program_button "DISCORD_BUTTON" "Discord" "Discord" "${DISCORD_ICON}" "INSTALL_DISCORD_POPUP")"'

      </hbox>
      </frame>

      <frame Utilitários>
      <hbox '"${FRAME_HBOX_CONFIG}"'>

        '"$(program_button "WINE_BUTTON" "Wine" "Wine" "${WINE_ICON}" "INSTALL_WINE_POPUP")"'
        '"$(program_button "CHROME_BUTTON" "Chrome" "Chrome" "${CHROME_ICON}" "INSTALL_CHROME_POPUP")"'
        '"$(program_button "BRAVE_BUTTON" "Brave" "Brave" "${BRAVE_ICON}" "INSTALL_BRAVE_POPUP")"'
        '"$(program_button "OPERA_BUTTON" "Opera" "Opera" "${OPERA_ICON}" "INSTALL_OPERA_POPUP")"'
        '"$(program_button "WINRAR_BUTTON" "WinRAR" "WinRAR" "${WINRAR_ICON}" "INSTALL_WINRAR_POPUP")"'

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
    <text><label>"Desmarque os programas que não deseja instalar."</label></text>

    <frame>

        ## PROGRAMADOR
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(package_tgbutton "P_TOOLBOX_TGBUTTON" "JetBrains ToolBox" "${TOOLBOX_ICON}")"'
          '"$(package_tgbutton "P_VSCODE_TGBUTTON" "Visual Studio" "${VSCODE_ICON}")"'
          '"$(package_tgbutton "P_INSOMNIA_TGBUTTON" "Insomnia" "${INSOMNIA_ICON}")"'
          '"$(package_tgbutton "P_BEEKEEPER_TGBUTTON" "Beekeeper" "${BEEKEEPER_ICON}")"'
          '"$(package_tgbutton "P_KUBERNETES_TGBUTTON" "Kubernetes" "${KUBERNETES_ICON}")"'
          '"$(package_tgbutton "P_DOCKER_TGBUTTON" "Docker" "${DOCKER_ICON}")"'
          '"$(package_tgbutton "P_NODE_TGBUTTON" "Node JS" "${NODE_ICON}")"'
          '"$(package_tgbutton "P_REACT_TGBUTTON" "React JS" "${REACT_ICON}")"'
          '"$(package_tgbutton "P_WINRAR_TGBUTTON" "WinRAR" "${WINRAR_ICON}")"'
          '"$(package_tgbutton "P_CHROME_TGBUTTON" "Chrome" "${CHROME_ICON}")"'
          '"$(package_tgbutton "P_BRAVE_TGBUTTON" "Brave" "${BRAVE_ICON}")"'
          '"$(package_tgbutton "P_OPERA_TGBUTTON" "Opera" "${OPERA_ICON}")"'
        <variable>PROGRAMADOR_VBOX</variable> </vbox>

        ## REDES
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(package_tgbutton "R_GOOGLE_CSDK_TGBUTTON" "Google Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
          '"$(package_tgbutton "R_TCPDUMP_TGBUTTON" "TCPdump" "${TCPDUMP_ICON}")"'
          '"$(package_tgbutton "R_WIRESHARK_TGBUTTON" "Wireshark" "${WIRESHARK_ICON}")"'
          '"$(package_tgbutton "R_VBOX_TGBUTTON" "Oracle Virtual Box" "${VBOX_ICON}")"'
          '"$(package_tgbutton "R_VMWARE_TGBUTTON" "VMWare" "${VMWARE_ICON}")"'
          '"$(package_tgbutton "R_FILEZILLA_TGBUTTON" "FileZilla" "${FILEZILLA_ICON}")"'
          '"$(package_tgbutton "R_PUTTY_TGBUTTON" "Putty" "${PUTTY_ICON}")"'
          '"$(package_tgbutton "R_REMMINA_TGBUTTON" "Remmina" "${REMMINA_ICON}")"'
          '"$(package_tgbutton "R_WINRAR_TGBUTTON" "WinRAR" "${WINRAR_ICON}")"'
          '"$(package_tgbutton "R_BRAVE_TGBUTTON" "Brave" "${BRAVE_ICON}")"'
        <variable>REDES_VBOX</variable> </vbox>

        ## ESCRITORIO
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(package_tgbutton "E_WPS_TGBUTTON" "WPS Office" "${WPS_ICON}")"'
          '"$(package_tgbutton "E_FOXIT_TGBUTTON" "Foxit PDF" "${FOXIT_ICON}")"'
          '"$(package_tgbutton "E_GIMP_TGBUTTON" "Gimp" "${GIMP_ICON}")"'
          '"$(package_tgbutton "E_KRITA_TGBUTTON" "Krita" "${KRITA_ICON}")"'
          '"$(package_tgbutton "E_INKSCAPE_TGBUTTON" "Inkscape" "${INKSCAPE_ICON}")"'
          '"$(package_tgbutton "E_MAILSPRING_TGBUTTON" "Mailspring" "${MAILSPRING_ICON}")"'
          '"$(package_tgbutton "E_AUDACITY_TGBUTTON" "Audacity" "${AUDACITY_ICON}")"'
          '"$(package_tgbutton "E_WINRAR_TGBUTTON" "WinRAR" "${WINRAR_ICON}")"'
          '"$(package_tgbutton "E_CHROME_TGBUTTON" "Chrome" "${CHROME_ICON}")"'
        <variable>ESCRITORIO_VBOX</variable> </vbox>

        ## LAZER
        <vbox '"${TGBUTTON_VBOX_CONFIG}"'>
          '"$(package_tgbutton "L_SPOTIFY_TGBUTTON" "Spotify" "${SPOTIFY_ICON}")"'
          '"$(package_tgbutton "L_SKYPE_TGBUTTON" "Skype" "${SKYPE_ICON}")"'
          '"$(package_tgbutton "L_DISCORD_TGBUTTON" "Discord" "${DISCORD_ICON}")"'
        <variable>LAZER_VBOX</variable> </vbox>

    </frame>

    '"${GAP}"'
    <button image-position="1" height-request="40">
      <label>Instalar</label>
      <input file icon="bottom"></input>
      '"${INSTALL_PACKAGE_BUTTON}"'
    </button>
    '"${GAP}"'

  </vbox>


  #################
  ## Desinstalar ##
  #################

  <vbox>

      <frame>

         <vbox '"${INSTALLED_VBOX_CONFIG}"'>
            '"$(uninstall_tgbutton "TOOLBOX_TGBUTTON" "JetBrains ToolBox" "${TOOLBOX_ICON}" )"'
            '"$(uninstall_tgbutton "VSCODE_TGBUTTON" "Visual Studio" "${VSCODE_ICON}")"'
            '"$(uninstall_tgbutton "INSOMNIA_TGBUTTON" "Insomnia" "${INSOMNIA_ICON}")"'
            '"$(uninstall_tgbutton "BEEKEEPER_TGBUTTON" "Beekeeper" "${BEEKEEPER_ICON}")"'
            '"$(uninstall_tgbutton "KUBERNETES_TGBUTTON" "Kubernetes" "${KUBERNETES_ICON}")"'
            '"$(uninstall_tgbutton "DOCKER_TGBUTTON" "Docker" "${DOCKER_ICON}")"'
            '"$(uninstall_tgbutton "NODE_TGBUTTON" "Node JS" "${NODE_ICON}")"'
            '"$(uninstall_tgbutton "REACT_TGBUTTON" "React JS" "${REACT_ICON}")"'
            '"$(uninstall_tgbutton "GOOGLE_CSDK_TGBUTTON" "Google Cloud SDK" "${GOOGLE_CSDK_ICON}")"'
            '"$(uninstall_tgbutton "TCPDUMP_TGBUTTON" "TCPdump" "${TCPDUMP_ICON}")"'
            '"$(uninstall_tgbutton "WIRESHARK_TGBUTTON" "Wireshark" "${WIRESHARK_ICON}")"'
            '"$(uninstall_tgbutton "VBOX_TGBUTTON" "Oracle Virtual Box" "${VBOX_ICON}")"'
            '"$(uninstall_tgbutton "VMWARE_TGBUTTON" "VMWare" "${VMWARE_ICON}")"'
            '"$(uninstall_tgbutton "FILEZILLA_TGBUTTON" "FileZilla" "${FILEZILLA_ICON}")"'
            '"$(uninstall_tgbutton "PUTTY_TGBUTTON" "Putty" "${PUTTY_ICON}")"'
            '"$(uninstall_tgbutton "REMMINA_TGBUTTON" "Remmina" "${REMMINA_ICON}")"'
            '"$(uninstall_tgbutton "WPS_TGBUTTON" "WPS Office" "${WPS_ICON}")"'
            '"$(uninstall_tgbutton "FOXIT_TGBUTTON" "Foxit PDF" "${FOXIT_ICON}")"'
            '"$(uninstall_tgbutton "GIMP_TGBUTTON" "Gimp" "${GIMP_ICON}")"'
            '"$(uninstall_tgbutton "KRITA_TGBUTTON" "Krita" "${KRITA_ICON}")"'
            '"$(uninstall_tgbutton "INKSCAPE_TGBUTTON" "Inkscape" "${INKSCAPE_ICON}")"'
            '"$(uninstall_tgbutton "MAILSPRING_TGBUTTON" "Mailspring" "${MAILSPRING_ICON}")"'
            '"$(uninstall_tgbutton "AUDACITY_TGBUTTON" "Audacity" "${AUDACITY_ICON}")"'
            '"$(uninstall_tgbutton "SPOTIFY_TGBUTTON" "Spotify" "${SPOTIFY_ICON}")"'
            '"$(uninstall_tgbutton "SKYPE_TGBUTTON" "Skype" "${SKYPE_ICON}")"'
            '"$(uninstall_tgbutton "DISCORD_TGBUTTON" "Discord" "${DISCORD_ICON}")"'
            '"$(uninstall_tgbutton "WINRAR_TGBUTTON" "WinRAR" "${WINRAR_ICON}")"'
            '"$(uninstall_tgbutton "CHROME_TGBUTTON" "Chrome" "${CHROME_ICON}")"'
            '"$(uninstall_tgbutton "BRAVE_TGBUTTON" "Brave" "${BRAVE_ICON}")"'
            '"$(uninstall_tgbutton "OPERA_TGBUTTON" "Opera" "${OPERA_ICON}")"'
            '"$(uninstall_tgbutton "WINE_TGBUTTON" "Wine" "${WINE_ICON}")"'
         <variable>UNINSTALL_VBOX</variable> </vbox>

      </frame>

    '"${GAP}"'
    <button image-position="1" height-request="40">
      <label>Desinstalar</label>
      <input file icon="stop"></input>
      '"${UNINSTALL_PROGRAMS_BUTTON}"'
    </button>
    '"${GAP}"'

  </vbox>

</notebook>
</window>
'

sed -e "s/##.*//" <<< "${XML}" > /tmp/xml

case ${CONFIG} in
-d | --dump) echo "${XML}" ;;
*) gtkdialog --file=/tmp/xml --center 2>/dev/null;;
esac
