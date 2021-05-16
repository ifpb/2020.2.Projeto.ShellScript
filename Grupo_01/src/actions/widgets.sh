#!/bin/bash

# BUTTON
## PACKAGE_BUTTON
PACKAGE_PROGRAMADOR_BUTTON_ACTIONS='<action type="enable">REDES_BUTTON</action>
                                    <action type="enable">ESCRITORIO_BUTTON</action>
                                    <action type="enable">LAZER_BUTTON</action>
                                    <action type="hide">REDES_VBOX</action>
                                    <action type="hide">ESCRITORIO_VBOX</action>
                                    <action type="hide">LAZER_VBOX</action>
                                    <action type="show">PROGRAMADOR_VBOX</action>
                                    '

PACKAGE_REDES_BUTTON_ACTIONS='<action type="enable">PROGRAMADOR_BUTTON</action>
                              <action type="enable">ESCRITORIO_BUTTON</action>
                              <action type="enable">LAZER_BUTTON</action>
                              <action type="hide">PROGRAMADOR_VBOX</action>
                              <action type="hide">ESCRITORIO_VBOX</action>
                              <action type="hide">LAZER_VBOX</action>
                              <action type="show">REDES_VBOX</action>
                              '

PACKAGE_ESCRITORIO_BUTTON_ACTIONS='<action type="enable">REDES_BUTTON</action>
                                   <action type="enable">PROGRAMADOR_BUTTON</action>
                                   <action type="enable">LAZER_BUTTON</action>
                                   <action type="hide">REDES_VBOX</action>
                                   <action type="hide">PROGRAMADOR_VBOX</action>
                                   <action type="hide">LAZER_VBOX</action>
                                   <action type="show">ESCRITORIO_VBOX</action>
                                   '

PACKAGE_LAZER_BUTTON_ACTIONS='<action type="enable">REDES_BUTTON</action>
                              <action type="enable">ESCRITORIO_BUTTON</action>
                              <action type="enable">PROGRAMADOR_BUTTON</action>
                              <action type="hide">REDES_VBOX</action>
                              <action type="hide">ESCRITORIO_VBOX</action>
                              <action type="hide">PROGRAMADOR_VBOX</action>
                              <action type="show">LAZER_VBOX</action>
                              '