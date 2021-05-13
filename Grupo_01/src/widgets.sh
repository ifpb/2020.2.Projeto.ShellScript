#!/bin/bash

# Importar Configurações de Estilo
source "${DIR_PATH}/src/style.sh"

# BUTTON
# 1 - Tooltip-markup | 2 - Label | 3 - Input File
function button() {
    cat <<EXIT
    <button tooltip-markup="<b><i> ${1} </i></b>" image-position="${BUTTON_IMG_POSITION}">
      <height>"${BUTTON_SIZE}"</height> <width>"${BUTTON_SIZE}"</width>
      <label>${2}</label>
      <action>echo ${1}</action>
      <input file>${3}</input>
    </button>
EXIT
}
