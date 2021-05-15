#!/bin/bash

# Importar Configurações de Estilo
source "${DIR_PATH}/src/style.sh"

# BUTTON
# 1 - Tooltip-markup | 2 - Label | 3 - Input File
function button() {
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

# TGBUTTON
# 1 - Tooltip-markup | 2 - Label | 3 - Input File
function tgbutton() {
    cat <<EXIT
    <togglebutton tooltip-markup="<b><i> ${1} </i></b>">
      <label>"  ${2}"</label>
      <input file>${3}</input>
      <height>"${TGBUTTON_IMG_SIZE}"</height> <width>"${TGBUTTON_IMG_SIZE}"</width>
    </togglebutton>
EXIT
}
