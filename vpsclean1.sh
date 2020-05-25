#!/bin/bash
# criador @darkside54
# dia 12/05/2020
# script para limpeza e manutencao de servidores
x="teste"
menu ()
{
while true $x != "teste"
do
clear
# indentificacao do cabecalho da memoria etc.
if [[ "$(grep -c "Ubuntu" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f2 /etc/issue.net |awk -F "." '{print $1}')
elif [[ "$(grep -c "Debian" /etc/issue.net)" = "1" ]]; then
system=$(cut -d' ' -f1 /etc/issue.net)
system+=$(echo ' ')
system+=$(cut -d' ' -f3 /etc/issue.net)
else
system=$(cut -d' ' -f1 /etc/issue.net)
fi
_ram=$(printf ' %-9s' "$(free -h | grep -i mem | awk {'print $2'})")
_usor=$(printf '%-8s' "$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')")
_usop=$(printf '%-1s' "$(top -bn1 | awk '/Cpu/ { cpu = "" 100 - $8 "%" }; END { print cpu }')")
_core=$(printf '%-1s' "$(grep -c cpu[0-9] /proc/stat)")
_system=$(printf '%-14s' "$system")
_hora=$(printf '%(%H:%M:%S)T')
# menu painel inicial
echo ""
echo ""
echo -e "\033[37;45m    \033[1;37m  ##########[\033[1;36m VPS CLEAN PRO V1 \033[1;37m]##########       \033[0m"
echo -e "\033[1;37m_____________________________________________________\033[0m"
echo -e "\033[1;36mMEMORIA RAM      SISTEMA            PROCESSADOR "
echo -e "\033[1;33mTOTAL:\033[1;32m$_ram \033[1;33mOS:\033[1;32m$_system  \033[1;33mNUCLEO:\033[1;32m$_core"
echo -e "\033[1;33mUSADA:\033[1;32m$_usor   \033[1;33mHORA:\033[1;32m$_hora      \033[1;33mUSO:\033[1;32m$_usop"echo -e "\033[1;37m_____________________________________________________\033[0m"
echo ""
echo -e "\033[1;35mSCRIPT PARA GERENCIAMENTO E MANUTENCAO DE SERVIDORES\033[0m"
echo -e "\033[1;37m_____________________________________________________\033[0m"
echo -e "\033[1;31m[\033[1;37mMENU\033[1;31m]_______________\033[1;37mVPS-CLEAN-V1\033[1;31m____________________"
echo ""
echo -e "\033[1;33m[\033[1;37m1\033[1;33m]\033[1;36mINSTALAR UM PROGRAMA  \033[1;33m[\033[1;37m5\033[1;33m]\033[1;36mREMOVER PACOTES/DEFEITO\033[0m"
echo -e "\033[1;33m[\033[1;37m2\033[1;33m]\033[1;31mREMOVER UM PROGRAMA   \033[1;33m[\033[1;37m6\033[1;33m]\033[1;36mCORRIGIR ERROS\033[0m"
echo -e "\033[1;33m[\033[1;37m3\033[1;33m]\033[1;36mATUALIZAR SISTEMA     \033[1;33m[\033[1;37m7\033[1;33m]\033[1;36mFAZER MANUTENCAO COMPLETA\033[0m"
echo -e "\033[1;33m[\033[1;37m4\033[1;33m]\033[1;36mINSTALAR DEPENDENCIAS \033[1;33m[\033[1;37m0\033[1;33m]\033[1;33mSAIR\036[0m"
echo -e "\033[1;31m                                     by:\033[1;35m@Darkside54\033[0m"
echo -e "\033[1;31mgrupo:\033[1;37mt.me/conexaobrasilinjector"
echo -e "\033[1;37m_____________________________________________________\033[0m"
echo ""
echo -ne "\033[1;33mDIGITE A OPCAO?:\033[1;37m"
read x
echo -e "\033[1;32mOpção informada \033[1;31m[\033[1;37m$x\033[1;31m]\033[0m"
echo -e "\033[1;37m_____________________________________________________\033[0m"
echo ""
# funcoes do painel
case "$x" in
    1)
      echo -e "\033[1;33mInforme o nome do pacote para ser instalado?\033[37m"
      read nome
      apt-get install $nome
      sleep 2
echo -e "\033[1;37m__________________________________________________\033[0m"
;;
    2)
      echo -e "\033[1;33mInforme o nome do pacote para ser removido?\033[37m"
      read nome
      apt-get remove --purge -y $nome
      sleep 2
echo -e "\033[1;37m_____________________________________________________________\033[0m"
;;
   3)
      echo -e "\033[1;33mAtualizando sistema...\033[1;37m"
      echo ""
      apt-get update
      sleep 2
echo -e "\033[1;37m_________________________________________________________\033[0m"
;;
    4)
       echo -e "\033[1;33mIniciando o processo...\033[1;37m"
       echo ""
       apt-get -f install
       sleep 2
echo -e "\033[1;37m___________________________________________________\033[0m"
;;
     5)
       echo -e "\033[1;33mRemovendo pacotes com defeito...\033[1;37m"
       echo ""
       apt-get autoremove
       sleep 2
echo -e "\033[1;37m__________________________________________________\033[0m"
;;
    6)
    echo -e "\033[1;33mReparando...\033[1;37m"
    echo ""
    dpkg --configure -a
    sleep 2
echo -e "\033[1;37m_____________________________________________________\033[0m"
 ;;
    7)
    echo -e "\033[1;33mINICIANDO MANUTENCAO...\033[1;37m"
    echo ""
    echo -e "\033[1;31m  ATUALIZANDO SISTEMA...\033[0m"
    apt-get update -y
    apt-get upgrade -y
    clear
    echo ""
    echo -e "\033[1;31m LIMPANDO LIXEIRA...\033[0m"
    sleep 2
    rm -rf /home/$USER/.local/share/Trash/files/*
    clear
    echo ""
    echo -e "\033[1;31m LIMPANDO PASTA TMP...\033[0m"
    sleep 2
    rm -rf /var/tmp/*
    clear
    echo ""
    echo -e "\033[1;31m EXCLUIDO CACHE...\033[0m"
    sleep 2
    apt-get clean -y
    clear
    echo ""
    echo -e "\033[1;31m REMOVENDO PACOTES INUTEIS...\033[0m"
    sleep 2
    apt-get autoremove -y
    clear
    echo ""
    echo -e "\033[1;31m REMOVENDO PACOTES DUPLICADOS...\033[0m"
    sleep 2
    apt-get autoclean -y
    clear
    echo ""
    echo -e "\033[1;31m REPARANDO PACOTES...\033[0m"
    sleep 2
    dpkg --configure -a
    clear
    echo ""
    echo -e "\033[1;31m REMOVENDO PACOTES INUTEIS...\033[0m"
    sleep 2
    apt-get autoremove -f
    clear
    echo -e "\033[1;33m  LIMPEZA CONCLUIDA COM SUCESSO!!!\033[0m"
    sleep 2
    echo -e "\033[1;36m  VOLTANDO AO MENU......\033[0m"
    sleep 2
echo -e "\033[1;37m_____________________________________________________\033[0m"
;;
       0)
         echo -e "\033[1;33msaindo...\033[0m"
         sleep 1
         clear;
         exit;
echo -e "\033[1;37m__________________________________________________\033[0m"
;;

*)
        echo "Opção inválida!\033[0m"

esac
done

}
menu
