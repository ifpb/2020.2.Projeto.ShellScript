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
