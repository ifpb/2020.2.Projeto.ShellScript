#!/bin/bash

# shellcheck disable=SC2016

# Caminho da Pasta do Script
DIR_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

# Importar Ícones dos Programas
source "${DIR_PATH}/src/img/icons.sh"

# Importar Padrões de Widgets
source "${DIR_PATH}/src/widgets.sh"

XML='

<window title="Programinha" icon-name="gtk-about" resizable="false">

<vbox>
  <frame Desenvolvimento>
  <hbox>

    <button tooltip-markup="<b><i> JetBrains ToolBox </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${TOOLBOX_ICON}"'</input>
      <action>echo "JetBrains ToolBox"</action>
      <label>ToolBox</label>
    </button>

    <button tooltip-markup="<b><i> Visual Studio </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${VSCODE_ICON}"'</input>
      <action>echo "Visual Studio"</action>
      <label>VSCode</label>
    </button>

    <button tooltip-markup="<b><i> Insomnia </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${INSOMNIA_ICON}"'</input>
      <action>echo "Insomnia"</action>
      <label>Insomnia</label>
    </button>

    <button tooltip-markup="<b><i> Beekeeper </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${BEEKEEPER_ICON}"'</input>
      <action>echo "Beekeeper"</action>
      <label>Beekeeper</label>
    </button>

    <button tooltip-markup="<b><i> Kubernetes </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${KUBERNETES_ICON}"'</input>
      <action>echo "Kubernetes"</action>
      <label>Kubernetes</label>
    </button>

    <button tooltip-markup="<b><i> Docker </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${DOCKER_ICON}"'</input>
      <action>echo "Docker"</action>
      <label>Docker</label>
    </button>

    <button tooltip-markup="<b><i> Node JS </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${NODE_ICON}"'</input>
      <action>echo "Node JS"</action>
      <label>Node JS</label>
    </button>

    <button tooltip-markup="<b><i> React JS </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${REACT_ICON}"'</input>
      <action>echo "React JS"</action>
      <label>React JS</label>
    </button>

  </hbox>
  </frame>

  <frame Redes>
  <hbox>

    <button tooltip-markup="<b><i> Google Cloud SDK </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${GOOGLE_CSDK_ICON}"'</input>
      <action>echo "Google Cloud SDK"</action>
      <label>Cloud SDK</label>
    </button>

    <button tooltip-markup="<b><i> TCPDump </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${TCPDUMP_ICON}"'</input>
      <action>echo "TCPDump"</action>
      <label>TCPDump</label>
    </button>

    <button tooltip-markup="<b><i> Wireshark </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${WIRESHARK_ICON}"'</input>
      <action>echo "Wireshark"</action>
      <label>Wireshark</label>
    </button>

    <button tooltip-markup="<b><i> Oracle Virtual Box </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${VBOX_ICON}"'</input>
      <action>echo "Virtual Box"</action>
      <label>Virtual Box</label>
    </button>

    <button tooltip-markup="<b><i> VMWare </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${VMWARE_ICON}"'</input>
      <action>echo "VMWare"</action>
      <label>VMWare</label>
    </button>

    <button tooltip-markup="<b><i> FileZilla </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${FILEZILLA_ICON}"'</input>
      <action>echo "FileZilla"</action>
      <label>FileZilla</label>
    </button>

    <button tooltip-markup="<b><i> Putty </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${PUTTY_ICON}"'</input>
      <action>echo "Putty"</action>
      <label>Putty</label>
    </button>

    <button tooltip-markup="<b><i> Remmina </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
      <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
      <input file>'"${REMMINA_ICON}"'</input>
      <action>echo "Remmina"</action>
      <label>Remmina</label>
    </button>

  </hbox>
  </frame>

  <hbox>
    <frame Entretenimento>
    <hbox>

      <button tooltip-markup="<b><i> Spotify </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${SPOTIFY_ICON}"'</input>
        <action>echo "Spotify"</action>
        <label>Spotify</label>
      </button>

      <button tooltip-markup="<b><i> Skype </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${SKYPE_ICON}"'</input>
        <action>echo "Skype"</action>
        <label>Skype</label>
      </button>

      <button tooltip-markup="<b><i> Discord </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${DISCORD_ICON}"'</input>
        <action>echo "Discord"</action>
        <label>Discord</label>
      </button>

    </hbox>
    </frame>

    <frame Utilitários>
    <hbox>

      <button tooltip-markup="<b><i> Wine </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${WINE_ICON}"'</input>
        <action>echo "Wine"</action>
        <label>Wine</label>
      </button>

      <button tooltip-markup="<b><i> Chrome </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${CHROME_ICON}"'</input>
        <action>echo "Chrome"</action>
        <label>Chrome</label>
      </button>

      <button tooltip-markup="<b><i> Brave </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${BRAVE_ICON}"'</input>
        <action>echo "Brave"</action>
        <label>Brave</label>
      </button>

      <button tooltip-markup="<b><i> Opera </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${OPERA_ICON}"'</input>
        <action>echo "Opera"</action>
        <label>Opera</label>
      </button>

      <button tooltip-markup="<b><i> WinRAR </i></b>" image-position="'"${BUTTON_IMG_POSITION}"'">
        <height>'"${BUTTON_SIZE}"'</height> <width>'"${BUTTON_SIZE}"'</width>
        <input file>'"${WINRAR_ICON}"'</input>
        <action>echo "WinRAR"</action>
        <label>WinRAR</label>
      </button>

    </hbox>
    </frame>
  </hbox>

</vbox>

</window>
'

export MAIN_DIALOG="$(sed -e "s/##.*//" <<< "${XML}")"

case $1 in
	-d | --dump) echo "$MAIN_DIALOG" ;;
	*) gtkdialog --program=MAIN_DIALOG --center ;;
esac
