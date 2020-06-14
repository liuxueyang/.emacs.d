#!/usr/bin/env bash

# 为一个新的 Github 账户生成 ssh-key
# 在 ~/.ssh/config 中添加配置
# 使用此账户 clone Github 上的 repo

########## environment configuration ##########
EMAIL=plis@acm.org
ID=plis
GITHUB_ID=plis-acm
TARGET_DIR=$HOME/Workspace/Emacs
HOST=github.com
EMACS_CONFIG_GIT=git@github-$ID:GITHUB_ID/.emacs.d.git
########## ====== ##########


SSH_CONFIG=$HOME/.ssh/config

# find private key filename
ssh_file_name=`grep $ID $HOME/.ssh/*.pub | cut -d : -f 1 | sed -e 's/.pub//g;'`
echo ssh_file_name=$ssh_file_name

add_ssh_config() {
    echo add config to $SSH_CONFIG...
    cat >> $SSH_CONFIG <<  EOF

Host github-$ID
     HostName github.com
     User git
     IdentityFile $ssh_file_name

EOF
}

short_ssh_file_name=$(echo $ssh_file_name | cut -d '/' -f 5)

if [ "$ssh_file_name" ] && [ -f "$ssh_file_name" ]
then
    echo "ssh private key file exists."
    # check ssh config
    ssh_file_contain=`grep ".ssh/$short_ssh_file_name$" $SSH_CONFIG`
    ssh_host=$(grep -B 3 ".ssh/$short_ssh_file_name$" $SSH_CONFIG | \
                   grep $HOST)
    echo ssh_file_contain=$ssh_file_contain, ssh_host=$ssh_host

    if [ -n "$ssh_file_contain" ] && [ -n "$ssh_host" ]
    then
        echo "$ssh_file_name ssh config for $HOST exists"
    else
        echo "just add ssh config"
        add_ssh_config
    fi
else
    ssh_file_name=$HOME/.ssh/id_rsa_$ID
    # generate ssh private/pub key
    echo generage ssh key file using ssh-keygen...
    ssh-keygen -q -t rsa -b 4096 -C "$EMAIL" -f $ssh_file_name
    # add config to ssh config
    add_ssh_config
fi

echo "copy public ssh key to clipboard..."
uname_str=`uname`
copy_command=""
case $uname_str in
    FreeBSD ) copy_command="xsel -ib"
              ;;
    Darwin ) copy_command="pbcopy"
             ;;
esac
cat $ssh_file_name.pub | $copy_command

# read input from user
read -n1 -p "already paste public key to $HOST? (Y/N)?" answer

git_clone_repo() {
    echo clone $EMACS_CONFIG_GIT to $TARGET_DIR ...
    if git config user.name
    then
	echo
    else
	git config --global user.name $ID
    fi

    if git config user.email
    then
	echo
    else
	git config --global user.email $EMAIL
    fi

    echo "git cloning repo:" $EMACS_CONFIG_GIT "to $TARGET_DIR"
    git clone $EMACS_CONFIG_GIT $TARGET_DIR
    cd $TARGET_DIR
    git config --local user.name "$ID"
    git config --local user.email "$EMAIL"
}

case $answer in
    Y | y ) echo
	    echo answer $answer

	    if [ -d $TARGET_DIR ]
	    then
		echo "Emacs configuration directory exists"
	    else
		if [ -d $HOME/Workspace ]
		then
		    if [ -w $HOME/Workspace ]
		    then
			git_clone_repo
		    fi
		else
		    mkdir $HOME/Workspace
		    git_clone_repo
		fi
	    fi
	    ;;
    * ) echo
	echo You HAVE TO paste that public key to $HOST.
esac

# emacs-deploy.sh ends here
