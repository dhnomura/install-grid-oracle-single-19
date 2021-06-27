#!/bin/bash

declare -i valida=0
isInstalled() {
    if rpm -q $1 &> /dev/null; then
#        echo "$1 is installed - ok";
        return 0;
    else
#        echo "$1 is not installed - nok";
        yum install $1* -y
        valida=$valida+1
    fi
}
array=( bc 
elfutils-libelf 
elfutils-libelf-devel 
fontconfig-devel 
libXrender 
libXrender-devel 
python  
python-configshell 
python-rtslib 
python-six 
targetcli 
binutils 
tree 
compat-libcap1 
compat-libstdc++-33 
compat-libstdc++-33.i686 
glibc 
glibc.i686 
glibc-devel 
glibc-devel.i686 
ksh libaio 
libaio.i686 
libaio-devel 
libaio-devel.i686 
libX11 
libX11.i686 
libXau 
libXau.i686 
libXi 
libXi.i686 
libXtst 
libXtst.i686 
libgcc 
libgcc.i686 
libstdc++ 
libstdc++.i686 
libstdc++-devel 
libstdc++-devel.i686 
libxcb 
libxcb.i686 
make 
nfs-utils 
net-tools 
smartmontools 
sysstat 
unixODBC 
unixODBC-devel 
gcc 
gcc-c++ 
libXext 
libXext.i686 
zlib-devel 
zlib-devel.i686
unzip
)
for i in "${array[@]}"
do
	isInstalled $i
done

if [ $valida -gt 0 ] ; then
    echo "Error - Please review the packages missing";
    exit 1;
else
    echo "OK - All packages are installed";
    exit 0;
fi

yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum install jq -y
