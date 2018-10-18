

mount_homedrive()
{
  mkdir ~/mnt/p
  mount -t smbfs //{PATH} ~/mnt/p
}


mount_connected_services_shared()
{
  mkdir ~/mnt/connected_services_collaboration
  mount -t smbfs //{PATH} ~/mnt/connected_services_collaboration
}


umounthomedrive()
{
  umount ~/mnt/p/
}

setnoproxy()
{
   setproxy ''
}


setlocalproxy() 
{
    setproxy 'http://localhost:3128' 
    echo "";
    echo "Proxy has been set to local"
}

setproxy()
{
    proxy=$1
    export http_proxy="${proxy}";
    export https_proxy="${proxy}";
    export HTTP_PROXY="${proxy}";
    export HTTPS_PROXY="${proxy}";
    export all_proxy="${proxy}";
    export ALL_PROXY="${proxy}";
    export ftp_proxy="${proxy}";
    export no_proxy=localhost
    
    git config --global --unset https.proxy
    git config --global --unset http.proxy
    git config --global https.proxy ${proxy}
    git config --global http.proxy ${proxy}

    echo '*** System env proxy vars***'
    echo `env | grep -i proxy`
    echo '***Git proxy vars***'
    echo `git config --global -l | grep -i proxy`
}

setnoproxy

export LSCOLORS="EHfxcxdxBxegecabagacad" 
alias ll='ls -lGaf'

