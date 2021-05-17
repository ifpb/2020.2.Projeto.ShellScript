#!/bin/bash

# Importar Configurações de Estilo
source "${DIR_PATH}/src/style.sh"

# BUTTON
# 1 - Var Name | 2 - Tooltip-markup | 3 - Label | 4 - Image | 5 - Pop-up Path
function program_button() {
  popup="${4}"
  cat <<EXIT
    <button tooltip-markup="<b><i> ${2} </i></b>"
            image-position="${BUTTON_IMG_POSITION}"
            height-request="${BUTTON_SIZE}" width-request="${BUTTON_SIZE}">
      <height>"${BUTTON_IMG_SIZE}"</height> <width>"${BUTTON_IMG_SIZE}"</width>
      <label>${3}</label>
      <input file>${4}</input>
      <action type="disable">${1}</action>
      <action type="launch">${5}</action>
    <variable>${1}</variable></button>
EXIT
}

# 1 - Label | 2 - Variable | 3 - Actions
function package_button() {
  cat <<EXIT
    <button sensitive="true"
            width-request="110">
      <label>${1}</label>
      <variable>${2}</variable>
      <action type="disable">${2}</action>
      ${3}
    </button>
EXIT
}

# TGBUTTON
# 1 - Tooltip-markup | 2 - Label | 3 - Image
function tgbutton() {
  cat <<EXIT
    <togglebutton>
      <label>"  ${1}"</label>
      <input file>${2}</input>
      <height>"${TGBUTTON_IMG_SIZE}"</height> <width>"${TGBUTTON_IMG_SIZE}"</width>
    </togglebutton>
EXIT
}


# GAP
GAP='<text width-chars="40" height-request="15"><label>""</label></text>'

# REFRESH
REFRESH_BUTTON='<button image-position="1">
                <label>Refresh</label>
                <input file icon="reload"></input>
                <action>echo Refresh...[Mentira]</action>
                </button>'
