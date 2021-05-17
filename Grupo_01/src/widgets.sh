#!/bin/bash

# Importar Configurações de Estilo
source "${DIR_PATH}/src/style.sh"

# BUTTON
# 1 - Tooltip-markup | 2 - Label | 3 - Input File
function program_button() {
    cat <<EXIT
    <button tooltip-markup="<b><i> ${1} </i></b>"
            image-position="${BUTTON_IMG_POSITION}"
            height-request="${BUTTON_SIZE}" width-request="${BUTTON_SIZE}">
      <height>"${BUTTON_IMG_SIZE}"</height> <width>"${BUTTON_IMG_SIZE}"</width>
      <label>${2}</label>
      <input file>${3}</input>
      <action>echo ${1}</action>
    </button>
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
# 1 - Tooltip-markup | 2 - Label | 3 - Input File
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