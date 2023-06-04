 #!/bin/bash

#Bad option selection exitting.
#In function barae zamani hast ke karbar entekhabe eshtebah mikonad
#va hame chiz be tanzimate default barmigardad.
function bad_option_exit {
sudo sysctl net.mptcp.mptcp_enabled=1
           sudo sysctl net.mptcp.mptcp_path_manager=fullmesh
           sudo sysctl net.mptcp.mptcp_scheduler=default
           sudo sysctl net.ipv4.tcp_congestion_control=cubic
           clear
           printf "Bad option.\n"
           printf "Configuation has been reverted to default.\n"
           printf "MPTCP has been enabled.\n"
           printf "Path manager is fullmesh.\n"
           printf "Scheduler is default.\n"
           printf "Congestion control is cubic.\n"
}

function default_mode {
           sudo sysctl net.mptcp.mptcp_enabled=1
           sudo sysctl net.mptcp.mptcp_path_manager=fullmesh
           sudo sysctl net.mptcp.mptcp_scheduler=default
           sudo sysctl net.ipv4.tcp_congestion_control=cubic
           clear
           printf "The default mode has been activated.\n"
           printf "MPTCP has been enabled.\n"
           printf "Path manager is fullmesh.\n"
           printf "Scheduler is default.\n"
           printf "Congestion control is cubic.\n"
}

#Choosing the default, manual, or proxy mode.
        OPTIONS_first="default manual proxy exit"
        select opt_first in $OPTIONS_first; do
        if [ "$opt_first" = "default" ]; then
           default_mode
           exit

        elif [ "$opt_first" = "manual" ]; then
	printf "The manual mode has been activated.\n"

#For the proxy part.
        elif [ "$opt_first" = "proxy" ]; then
        printf "Please choose to turn on or off the proxy.\n"
        OPTIONS_proxy="turn_on_proxy turn_off_proxy exit"
        select opt_proxy in $OPTIONS_proxy; do

       if [ "$opt_proxy" = "turn_on_proxy" ]; then
       printf "Please do the follwoing configurations.\n"
       printf "Open Firefox/ settings/ Network Settings/ Settings/\n"
       printf "Select Manual proxy configuration \n"
       printf "Change SOCKS Host to:  and port to: 1080 \n"
       exit


       elif [ "$opt_proxy" = "turn_off_proxy" ]; then
       printf "Please do the follwoing configurations.\n"
       printf "Open Firefox/ settings/ Network Settings/ Settings/\n"
       printf "Select No Proxy. \n"
       exit

       elif [ "$opt_proxy" = "exit" ]; then
       exit

        else
        bad_option_exit
        exit


fi
done

        elif [ "$opt_first" = "exit" ]; then
        exit

        else
        bad_option_exit
        exit

fi

#MPTCP enablin/disabling
       OPTIONS="mptcp_enable mptcp_disable exit"
       select opt in $OPTIONS; do
           if [ "$opt" = "mptcp_enable" ]; then
           sudo sysctl net.mptcp.mptcp_enabled=1
           clear
           printf "MPTCP has been eabled.\n"
           echo


#Path_Manager
        echo "Choose the path manager:"
        OPTIONS_path_manager="fullmesh default ndiffports binder netlink exit"
        select opt_path_manager in $OPTIONS_path_manager; do

           if [ "$opt_path_manager" = "fullmesh" ]; then
           sudo sysctl net.mptcp.mptcp_path_manager=fullmesh
           clear
           echo "Path manager has been set to Fullmesh."
           echo
           #exit

           elif [ "$opt_path_manager" = "default" ]; then
           sudo sysctl net.mptcp.mptcp_path_manager=default
           clear
           echo "Path manager has been set to Default.\n"
           echo
          #exit


           elif [ "$opt_path_manager" = "ndiffports" ]; then
           sudo sysctl net.mptcp.mptcp_path_manager=ndiffports
           clear
           echo "Path manager has been set to ndiffports."
           echo
           #exit

           elif [ "$opt_path_manager" = "binder" ]; then
           sudo sysctl net.mptcp.mptcp_path_manager=binder
           clear
           echo "Path manager has been set to binder."
           echo
           #exit

           elif [ "$opt_path_manager" = "netlink" ]; then
           sudo sysctl net.mptcp.mptcp_path_manager=netlink
           clear
           echo "Path manager has been set to netlink."
           echo
           #exit

           elif [ "$opt_path_manager" = "exit" ]; then
           exit

           else
           bad_option_exit
           exit
	   fi




#Scheduler
       echo "Choose the scheduler:"
       OPTIONS_scheduler="default roundrobin redundant blest ecf exit"
       select opt_scheduler in $OPTIONS_scheduler; do
           if [ "$opt_scheduler" = "default" ]; then
           sudo sysctl net.mptcp.mptcp_scheduler=default
           clear
           echo "Scheduler has been set to Default."
           echo
           #exit

           elif [ "$opt_scheduler" = "roundrobin" ]; then
           sudo sysctl net.mptcp.mptcp_scheduler=roundrobin
           clear
           echo "Scheduler has been set to Roundrobin."
           echo
           #exit

           elif [ "$opt_scheduler" = "redundant" ]; then
           sudo sysctl net.mptcp.mptcp_scheduler=redundant
           clear
           echo "Scheduler has been set to Redundant."
           echo
           #exit

           elif [ "$opt_scheduler" = "blest" ]; then
           sudo sysctl net.mptcp.mptcp_scheduler=blest
           clear
           echo "Scheduler has been set to Blest."
           echo
           #exit

           elif [ "$opt_scheduler" = "ecf" ]; then
           sudo sysctl net.mptcp.mptcp_scheduler=ecf
           clear
           echo "Scheduler has been set to ECF."
           echo
           #exit

           elif [ "$opt_scheduler" = "exit" ]; then
           exit

           else
           bad_option_exit
           exit
	   fi

#Congestion_Control
       echo "Choose the congestion control:"
       OPTIONS_cc="existing_tcp_variants cubic reno lia olia balia wvegas exit"
       select opt_cc in $OPTIONS_cc; do

        if [ "$opt_cc" = "existing_tcp_variants" ]; then
	sysctl net.ipv4.tcp_available_congestion_control
	printf "For having all possible variants, please run the corresponding file.\n"
	printf "Please choose the desired variant.\n"

         elif [ "$opt_cc" = "cubic" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=cubic
          clear
          echo "Congestion control has been set to cubic."
          echo
          exit

          elif [ "$opt_cc" = "reno" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=reno
          clear
          echo "Congestion control has been set to reno."
          echo
          exit

          elif [ "$opt_cc" = "lia" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=lia
          clear
          echo "Congestion control has been set to lia."
          echo
          exit

          elif [ "$opt_cc" = "olia" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=olia
          clear
          echo "Congestion control has been set to olia."
          echo
          exit

          elif [ "$opt_cc" = "balia" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=balia
          clear
          echo "Congestion control has been set to balia."
          echo
          exit

          elif [ "$opt_cc" = "wvegas" ]; then
          sudo sysctl net.ipv4.tcp_congestion_control=wvegas
          clear
          echo "Congestion control has been set to wvegas."
          echo
          exit

          elif [ "$opt_cc" = "exit" ]; then
          exit

          else
          bad_option_exit
          exit
          fi


done
done
done
#exit

           elif [ "$opt" = "mptcp_disable" ]; then
           sudo sysctl net.mptcp.mptcp_enabled=0
           clear
	   echo "MPTCP is disabled."
 	   echo
           exit 

           elif [ "$opt" = "exit" ]; then
           exit

           #exit
           else
           bad_option_exit
           exit
fi



done
done


done
