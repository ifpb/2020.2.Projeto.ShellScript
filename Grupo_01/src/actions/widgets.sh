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
                                    <action function="activate" condition="active_is_false(P_TOOLBOX_TGBUTTON)">P_TOOLBOX_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_VSCODE_TGBUTTON)">P_VSCODE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_INSOMNIA_TGBUTTON)">P_INSOMNIA_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_BEEKEEPER_TGBUTTON)">P_BEEKEEPER_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_KUBERNETES_TGBUTTON)">P_KUBERNETES_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_DOCKER_TGBUTTON)">P_DOCKER_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_NODE_TGBUTTON)">P_NODE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_REACT_TGBUTTON)">P_REACT_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_WINRAR_TGBUTTON)">P_WINRAR_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_CHROME_TGBUTTON)">P_CHROME_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_BRAVE_TGBUTTON)">P_BRAVE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_false(P_OPERA_TGBUTTON)">P_OPERA_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_GOOGLE_CSDK_TGBUTTON)">R_GOOGLE_CSDK_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_TCPDUMP_TGBUTTON)">R_TCPDUMP_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_WIRESHARK_TGBUTTON)">R_WIRESHARK_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_VBOX_TGBUTTON)">R_VBOX_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_VMWARE_TGBUTTON)">R_VMWARE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_FILEZILLA_TGBUTTON)">R_FILEZILLA_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_PUTTY_TGBUTTON)">R_PUTTY_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_REMMINA_TGBUTTON)">R_REMMINA_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_WINRAR_TGBUTTON)">R_WINRAR_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(R_BRAVE_TGBUTTON)">R_BRAVE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_WPS_TGBUTTON)">E_WPS_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_FOXIT_TGBUTTON)">E_FOXIT_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_GIMP_TGBUTTON)">E_GIMP_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_KRITA_TGBUTTON)">E_KRITA_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_INKSCAPE_TGBUTTON)">E_INKSCAPE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_MAILSPRING_TGBUTTON)">E_MAILSPRING_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_AUDACITY_TGBUTTON)">E_AUDACITY_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_WINRAR_TGBUTTON)">E_WINRAR_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(E_CHROME_TGBUTTON)">E_CHROME_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(L_SPOTIFY_TGBUTTON)">L_SPOTIFY_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(L_SKYPE_TGBUTTON)">L_SKYPE_TGBUTTON</action>
                                    <action function="activate" condition="active_is_true(L_DISCORD_TGBUTTON)">L_DISCORD_TGBUTTON</action>
                                    '

PACKAGE_REDES_BUTTON_ACTIONS='<action type="enable">PROGRAMADOR_BUTTON</action>
                              <action type="enable">ESCRITORIO_BUTTON</action>
                              <action type="enable">LAZER_BUTTON</action>
                              <action type="hide">PROGRAMADOR_VBOX</action>
                              <action type="hide">ESCRITORIO_VBOX</action>
                              <action type="hide">LAZER_VBOX</action>
                              <action type="show">REDES_VBOX</action>
                              <action function="activate" condition="active_is_true(P_TOOLBOX_TGBUTTON)">P_TOOLBOX_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_VSCODE_TGBUTTON)">P_VSCODE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_INSOMNIA_TGBUTTON)">P_INSOMNIA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_BEEKEEPER_TGBUTTON)">P_BEEKEEPER_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_KUBERNETES_TGBUTTON)">P_KUBERNETES_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_DOCKER_TGBUTTON)">P_DOCKER_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_NODE_TGBUTTON)">P_NODE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_REACT_TGBUTTON)">P_REACT_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_WINRAR_TGBUTTON)">P_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_CHROME_TGBUTTON)">P_CHROME_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_BRAVE_TGBUTTON)">P_BRAVE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_OPERA_TGBUTTON)">P_OPERA_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_GOOGLE_CSDK_TGBUTTON)">R_GOOGLE_CSDK_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_TCPDUMP_TGBUTTON)">R_TCPDUMP_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_WIRESHARK_TGBUTTON)">R_WIRESHARK_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_VBOX_TGBUTTON)">R_VBOX_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_VMWARE_TGBUTTON)">R_VMWARE_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_FILEZILLA_TGBUTTON)">R_FILEZILLA_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_PUTTY_TGBUTTON)">R_PUTTY_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_REMMINA_TGBUTTON)">R_REMMINA_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_WINRAR_TGBUTTON)">R_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(R_BRAVE_TGBUTTON)">R_BRAVE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_WPS_TGBUTTON)">E_WPS_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_FOXIT_TGBUTTON)">E_FOXIT_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_GIMP_TGBUTTON)">E_GIMP_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_KRITA_TGBUTTON)">E_KRITA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_INKSCAPE_TGBUTTON)">E_INKSCAPE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_MAILSPRING_TGBUTTON)">E_MAILSPRING_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_AUDACITY_TGBUTTON)">E_AUDACITY_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_WINRAR_TGBUTTON)">E_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_CHROME_TGBUTTON)">E_CHROME_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(L_SPOTIFY_TGBUTTON)">L_SPOTIFY_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(L_SKYPE_TGBUTTON)">L_SKYPE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(L_DISCORD_TGBUTTON)">L_DISCORD_TGBUTTON</action>
                              '

PACKAGE_ESCRITORIO_BUTTON_ACTIONS='<action type="enable">REDES_BUTTON</action>
                                   <action type="enable">PROGRAMADOR_BUTTON</action>
                                   <action type="enable">LAZER_BUTTON</action>
                                   <action type="hide">REDES_VBOX</action>
                                   <action type="hide">PROGRAMADOR_VBOX</action>
                                   <action type="hide">LAZER_VBOX</action>
                                   <action type="show">ESCRITORIO_VBOX</action>
                                   <action function="activate" condition="active_is_true(P_TOOLBOX_TGBUTTON)">P_TOOLBOX_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_VSCODE_TGBUTTON)">P_VSCODE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_INSOMNIA_TGBUTTON)">P_INSOMNIA_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_BEEKEEPER_TGBUTTON)">P_BEEKEEPER_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_KUBERNETES_TGBUTTON)">P_KUBERNETES_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_DOCKER_TGBUTTON)">P_DOCKER_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_NODE_TGBUTTON)">P_NODE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_REACT_TGBUTTON)">P_REACT_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_WINRAR_TGBUTTON)">P_WINRAR_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_CHROME_TGBUTTON)">P_CHROME_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_BRAVE_TGBUTTON)">P_BRAVE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(P_OPERA_TGBUTTON)">P_OPERA_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_GOOGLE_CSDK_TGBUTTON)">R_GOOGLE_CSDK_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_TCPDUMP_TGBUTTON)">R_TCPDUMP_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_WIRESHARK_TGBUTTON)">R_WIRESHARK_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_VBOX_TGBUTTON)">R_VBOX_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_VMWARE_TGBUTTON)">R_VMWARE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_FILEZILLA_TGBUTTON)">R_FILEZILLA_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_PUTTY_TGBUTTON)">R_PUTTY_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_REMMINA_TGBUTTON)">R_REMMINA_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_WINRAR_TGBUTTON)">R_WINRAR_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(R_BRAVE_TGBUTTON)">R_BRAVE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_WPS_TGBUTTON)">E_WPS_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_FOXIT_TGBUTTON)">E_FOXIT_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_GIMP_TGBUTTON)">E_GIMP_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_KRITA_TGBUTTON)">E_KRITA_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_INKSCAPE_TGBUTTON)">E_INKSCAPE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_MAILSPRING_TGBUTTON)">E_MAILSPRING_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_AUDACITY_TGBUTTON)">E_AUDACITY_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_WINRAR_TGBUTTON)">E_WINRAR_TGBUTTON</action>
                                   <action function="activate" condition="active_is_false(E_CHROME_TGBUTTON)">E_CHROME_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(L_SPOTIFY_TGBUTTON)">L_SPOTIFY_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(L_SKYPE_TGBUTTON)">L_SKYPE_TGBUTTON</action>
                                   <action function="activate" condition="active_is_true(L_DISCORD_TGBUTTON)">L_DISCORD_TGBUTTON</action>
                                   '

PACKAGE_LAZER_BUTTON_ACTIONS='<action type="enable">REDES_BUTTON</action>
                              <action type="enable">ESCRITORIO_BUTTON</action>
                              <action type="enable">PROGRAMADOR_BUTTON</action>
                              <action type="hide">REDES_VBOX</action>
                              <action type="hide">ESCRITORIO_VBOX</action>
                              <action type="hide">PROGRAMADOR_VBOX</action>
                              <action type="show">LAZER_VBOX</action>
                              <action function="activate" condition="active_is_true(P_TOOLBOX_TGBUTTON)">P_TOOLBOX_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_VSCODE_TGBUTTON)">P_VSCODE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_INSOMNIA_TGBUTTON)">P_INSOMNIA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_BEEKEEPER_TGBUTTON)">P_BEEKEEPER_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_KUBERNETES_TGBUTTON)">P_KUBERNETES_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_DOCKER_TGBUTTON)">P_DOCKER_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_NODE_TGBUTTON)">P_NODE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_REACT_TGBUTTON)">P_REACT_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_WINRAR_TGBUTTON)">P_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_CHROME_TGBUTTON)">P_CHROME_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_BRAVE_TGBUTTON)">P_BRAVE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(P_OPERA_TGBUTTON)">P_OPERA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_GOOGLE_CSDK_TGBUTTON)">R_GOOGLE_CSDK_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_TCPDUMP_TGBUTTON)">R_TCPDUMP_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_WIRESHARK_TGBUTTON)">R_WIRESHARK_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_VBOX_TGBUTTON)">R_VBOX_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_VMWARE_TGBUTTON)">R_VMWARE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_FILEZILLA_TGBUTTON)">R_FILEZILLA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_PUTTY_TGBUTTON)">R_PUTTY_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_REMMINA_TGBUTTON)">R_REMMINA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_WINRAR_TGBUTTON)">R_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(R_BRAVE_TGBUTTON)">R_BRAVE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_WPS_TGBUTTON)">E_WPS_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_FOXIT_TGBUTTON)">E_FOXIT_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_GIMP_TGBUTTON)">E_GIMP_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_KRITA_TGBUTTON)">E_KRITA_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_INKSCAPE_TGBUTTON)">E_INKSCAPE_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_MAILSPRING_TGBUTTON)">E_MAILSPRING_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_AUDACITY_TGBUTTON)">E_AUDACITY_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_WINRAR_TGBUTTON)">E_WINRAR_TGBUTTON</action>
                              <action function="activate" condition="active_is_true(E_CHROME_TGBUTTON)">E_CHROME_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(L_SPOTIFY_TGBUTTON)">L_SPOTIFY_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(L_SKYPE_TGBUTTON)">L_SKYPE_TGBUTTON</action>
                              <action function="activate" condition="active_is_false(L_DISCORD_TGBUTTON)">L_DISCORD_TGBUTTON</action>
                              '

INSTALL_PACKAGE_BUTTON='<action function="activate" condition="active_is_true(P_TOOLBOX_TGBUTTON)">P_TOOLBOX_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_VSCODE_TGBUTTON)">P_VSCODE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_INSOMNIA_TGBUTTON)">P_INSOMNIA_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_BEEKEEPER_TGBUTTON)">P_BEEKEEPER_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_KUBERNETES_TGBUTTON)">P_KUBERNETES_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_DOCKER_TGBUTTON)">P_DOCKER_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_NODE_TGBUTTON)">P_NODE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_REACT_TGBUTTON)">P_REACT_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_WINRAR_TGBUTTON)">P_WINRAR_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_CHROME_TGBUTTON)">P_CHROME_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_BRAVE_TGBUTTON)">P_BRAVE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(P_OPERA_TGBUTTON)">P_OPERA_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_GOOGLE_CSDK_TGBUTTON)">R_GOOGLE_CSDK_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_TCPDUMP_TGBUTTON)">R_TCPDUMP_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_WIRESHARK_TGBUTTON)">R_WIRESHARK_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_VBOX_TGBUTTON)">R_VBOX_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_VMWARE_TGBUTTON)">R_VMWARE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_FILEZILLA_TGBUTTON)">R_FILEZILLA_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_PUTTY_TGBUTTON)">R_PUTTY_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_REMMINA_TGBUTTON)">R_REMMINA_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_WINRAR_TGBUTTON)">R_WINRAR_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(R_BRAVE_TGBUTTON)">R_BRAVE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_WPS_TGBUTTON)">E_WPS_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_FOXIT_TGBUTTON)">E_FOXIT_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_GIMP_TGBUTTON)">E_GIMP_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_KRITA_TGBUTTON)">E_KRITA_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_INKSCAPE_TGBUTTON)">E_INKSCAPE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_MAILSPRING_TGBUTTON)">E_MAILSPRING_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_AUDACITY_TGBUTTON)">E_AUDACITY_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_WINRAR_TGBUTTON)">E_WINRAR_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(E_CHROME_TGBUTTON)">E_CHROME_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(L_SPOTIFY_TGBUTTON)">L_SPOTIFY_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(L_SKYPE_TGBUTTON)">L_SKYPE_TGBUTTON</action>
                        <action function="activate" condition="active_is_true(L_DISCORD_TGBUTTON)">L_DISCORD_TGBUTTON</action>
                        <action condition="active_is_true(P_TOOLBOX_TGBUTTON)">'"${INSTALL_TOOLBOX}"'</action>
                        <action condition="active_is_true(P_VSCODE_TGBUTTON)">'"${INSTALL_VSCODE}"'</action>
                        <action condition="active_is_true(P_INSOMNIA_TGBUTTON)">'"${INSTALL_INSOMNIA}"'</action>
                        <action condition="active_is_true(P_BEEKEEPER_TGBUTTON)">'"${INSTALL_BEEKEEPER}"'</action>
                        <action condition="active_is_true(P_KUBERNETES_TGBUTTON)">'"${INSTALL_KUBERNETES}"'</action>
                        <action condition="active_is_true(P_DOCKER_TGBUTTON)">'"${INSTALL_DOCKER}"'</action>
                        <action condition="active_is_true(P_NODE_TGBUTTON)">'"${INSTALL_NODE}"'</action>
                        <action condition="active_is_true(P_REACT_TGBUTTON)">'"${INSTALL_REACT}"'</action>
                        <action condition="active_is_true(P_WINRAR_TGBUTTON)">'"${INSTALL_WINRAR}"'</action>
                        <action condition="active_is_true(P_CHROME_TGBUTTON)">'"${INSTALL_CHROME}"'</action>
                        <action condition="active_is_true(P_BRAVE_TGBUTTON)">'"${INSTALL_BRAVE}"'</action>
                        <action condition="active_is_true(P_OPERA_TGBUTTON)">'"${INSTALL_OPERA}"'</action>
                        <action condition="active_is_true(R_GOOGLE_CSDK_TGBUTTON)">'"${INSTALL_GOOGLE_CSDK}"'</action>
                        <action condition="active_is_true(R_TCPDUMP_TGBUTTON)">'"${INSTALL_TCPDUMP}"'</action>
                        <action condition="active_is_true(R_WIRESHARK_TGBUTTON)">'"${INSTALL_WIRESHARK}"'</action>
                        <action condition="active_is_true(R_VBOX_TGBUTTON)">'"${INSTALL_VBOX}"'</action>
                        <action condition="active_is_true(R_VMWARE_TGBUTTON)">'"${INSTALL_VMWARE}"'</action>
                        <action condition="active_is_true(R_FILEZILLA_TGBUTTON)">'"${INSTALL_FILEZILLA}"'</action>
                        <action condition="active_is_true(R_PUTTY_TGBUTTON)">'"${INSTALL_PUTTY}"'</action>
                        <action condition="active_is_true(R_REMMINA_TGBUTTON)">'"${INSTALL_REMMINA}"'</action>
                        <action condition="active_is_true(R_WINRAR_TGBUTTON)">'"${INSTALL_WINRAR}"'</action>
                        <action condition="active_is_true(R_BRAVE_TGBUTTON)">'"${INSTALL_BRAVE}"'</action>
                        <action condition="active_is_true(E_WPS_TGBUTTON)">'"${INSTALL_WPS}"'</action>
                        <action condition="active_is_true(E_FOXIT_TGBUTTON)">'"${INSTALL_FOXIT}"'</action>
                        <action condition="active_is_true(E_GIMP_TGBUTTON)">'"${INSTALL_GIMP}"'</action>
                        <action condition="active_is_true(E_KRITA_TGBUTTON)">'"${INSTALL_KRITA}"'</action>
                        <action condition="active_is_true(E_INKSCAPE_TGBUTTON)">'"${INSTALL_INKSCAPE}"'</action>
                        <action condition="active_is_true(E_MAILSPRING_TGBUTTON)">'"${INSTALL_MAILSPRING}"'</action>
                        <action condition="active_is_true(E_AUDACITY_TGBUTTON)">'"${INSTALL_AUDACITY}"'</action>
                        <action condition="active_is_true(E_WINRAR_TGBUTTON)">'"${INSTALL_WINRAR}"'</action>
                        <action condition="active_is_true(E_CHROME_TGBUTTON)">'"${INSTALL_CHROME}"'</action>
                        <action condition="active_is_true(L_SPOTIFY_TGBUTTON)">'"${INSTALL_SPOTIFY}"'</action>
                        <action condition="active_is_true(L_SKYPE_TGBUTTON)">'"${INSTALL_SKYPE}"'</action>
                        <action condition="active_is_true(L_DISCORD_TGBUTTON)">'"${INSTALL_DISCORD}"'</action>
                        '

UNINSTALL_PROGRAMS_BUTTON='<action function="activate" condition="active_is_true(TOOLBOX_TGBUTTON)">TOOLBOX_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(VSCODE_TGBUTTON)">VSCODE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(INSOMNIA_TGBUTTON)">INSOMNIA_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(BEEKEEPER_TGBUTTON)">BEEKEEPER_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(KUBERNETES_TGBUTTON)">KUBERNETES_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(DOCKER_TGBUTTON)">DOCKER_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(NODE_TGBUTTON)">NODE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(REACT_TGBUTTON)">REACT_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(CHROME_TGBUTTON)">CHROME_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(OPERA_TGBUTTON)">OPERA_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(GOOGLE_CSDK_TGBUTTON)">GOOGLE_CSDK_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(TCPDUMP_TGBUTTON)">TCPDUMP_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(WIRESHARK_TGBUTTON)">WIRESHARK_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(VBOX_TGBUTTON)">VBOX_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(VMWARE_TGBUTTON)">VMWARE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(FILEZILLA_TGBUTTON)">FILEZILLA_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(PUTTY_TGBUTTON)">PUTTY_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(REMMINA_TGBUTTON)">REMMINA_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(BRAVE_TGBUTTON)">BRAVE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(WPS_TGBUTTON)">WPS_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(FOXIT_TGBUTTON)">FOXIT_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(GIMP_TGBUTTON)">GIMP_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(KRITA_TGBUTTON)">KRITA_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(INKSCAPE_TGBUTTON)">INKSCAPE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(MAILSPRING_TGBUTTON)">MAILSPRING_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(AUDACITY_TGBUTTON)">AUDACITY_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(WINRAR_TGBUTTON)">WINRAR_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(SPOTIFY_TGBUTTON)">SPOTIFY_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(SKYPE_TGBUTTON)">SKYPE_TGBUTTON</action>
                           <action function="activate" condition="active_is_true(DISCORD_TGBUTTON)">DISCORD_TGBUTTON</action>
                           <action condition="active_is_true(TOOLBOX_TGBUTTON)">'"${UNINSTALL_TOOLBOX}"'</action>
                           <action condition="active_is_true(VSCODE_TGBUTTON)">'"${UNINSTALL_VSCODE}"'</action>
                           <action condition="active_is_true(INSOMNIA_TGBUTTON)">'"${UNINSTALL_INSOMNIA}"'</action>
                           <action condition="active_is_true(BEEKEEPER_TGBUTTON)">'"${UNINSTALL_BEEKEEPER}"'</action>
                           <action condition="active_is_true(KUBERNETES_TGBUTTON)">'"${UNINSTALL_KUBERNETES}"'</action>
                           <action condition="active_is_true(DOCKER_TGBUTTON)">'"${UNINSTALL_DOCKER}"'</action>
                           <action condition="active_is_true(NODE_TGBUTTON)">'"${UNINSTALL_NODE}"'</action>
                           <action condition="active_is_true(REACT_TGBUTTON)">'"${UNINSTALL_REACT}"'</action>
                           <action condition="active_is_true(OPERA_TGBUTTON)">'"${UNINSTALL_OPERA}"'</action>
                           <action condition="active_is_true(GOOGLE_CSDK_TGBUTTON)">'"${UNINSTALL_GOOGLE_CSDK}"'</action>
                           <action condition="active_is_true(TCPDUMP_TGBUTTON)">'"${UNINSTALL_TCPDUMP}"'</action>
                           <action condition="active_is_true(WIRESHARK_TGBUTTON)">'"${UNINSTALL_WIRESHARK}"'</action>
                           <action condition="active_is_true(VBOX_TGBUTTON)">'"${UNINSTALL_VBOX}"'</action>
                           <action condition="active_is_true(VMWARE_TGBUTTON)">'"${UNINSTALL_VMWARE}"'</action>
                           <action condition="active_is_true(FILEZILLA_TGBUTTON)">'"${UNINSTALL_FILEZILLA}"'</action>
                           <action condition="active_is_true(PUTTY_TGBUTTON)">'"${UNINSTALL_PUTTY}"'</action>
                           <action condition="active_is_true(REMMINA_TGBUTTON)">'"${UNINSTALL_REMMINA}"'</action>
                           <action condition="active_is_true(BRAVE_TGBUTTON)">'"${UNINSTALL_BRAVE}"'</action>
                           <action condition="active_is_true(WPS_TGBUTTON)">'"${UNINSTALL_WPS}"'</action>
                           <action condition="active_is_true(FOXIT_TGBUTTON)">'"${UNINSTALL_FOXIT}"'</action>
                           <action condition="active_is_true(GIMP_TGBUTTON)">'"${UNINSTALL_GIMP}"'</action>
                           <action condition="active_is_true(KRITA_TGBUTTON)">'"${UNINSTALL_KRITA}"'</action>
                           <action condition="active_is_true(INKSCAPE_TGBUTTON)">'"${UNINSTALL_INKSCAPE}"'</action>
                           <action condition="active_is_true(MAILSPRING_TGBUTTON)">'"${UNINSTALL_MAILSPRING}"'</action>
                           <action condition="active_is_true(AUDACITY_TGBUTTON)">'"${UNINSTALL_AUDACITY}"'</action>
                           <action condition="active_is_true(WINRAR_TGBUTTON)">'"${UNINSTALL_WINRAR}"'</action>
                           <action condition="active_is_true(CHROME_TGBUTTON)">'"${UNINSTALL_CHROME}"'</action>
                           <action condition="active_is_true(SPOTIFY_TGBUTTON)">'"${UNINSTALL_SPOTIFY}"'</action>
                           <action condition="active_is_true(SKYPE_TGBUTTON)">'"${UNINSTALL_SKYPE}"'</action>
                           <action condition="active_is_true(DISCORD_TGBUTTON)">'"${UNINSTALL_DISCORD}"'</action>
                           '