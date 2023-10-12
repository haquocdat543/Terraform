#!/bin/bash
## Run bash from internet using following command: 
## bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/alias.sh )
## If you want to run k8s master on centos. Run following command: 
## bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/master-centos.sh)
## If you want to run k8s worker on centos. Run following command: 
## bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/worker-centos.sh)
## If you want to run k8s worker or master on ubuntu. Replace centos with ubuntu 

### clean "~/.bashrc"  before writing new alias
### If .bashrc file does not exist. Create it and write content from "default-bashrc file to it.
if [ ! -f ~/.bashrc ]
then
	touch ~/.bashrc && curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/default-bashrc | sudo tee -a ~/.bashrc 
fi
## If .bashrc.backup file in in root folder and preconfig/backup/.bashrc.backup folder does not exist. Create it 
if [ ! -f ~/.bashrc.backup ] && [ ! -f ~/preconfig/backup/.bashrc.backup ]
then
	cp -f ~/.bashrc ~/.bashrc.backup 
fi

## If .bashrc~ exist. Delete it 
if [ -f ~/bashrc~ ]
then
	rm -f ~/.bashrc~
fi

mv -f ~/.bashrc ~/.bashrc~

sudo sed '/^alias/d' ~/.bashrc~ | sudo sed '/^$/d' | sudo sed '/^##/d' | sudo tee ~/.bashrc

## If preconfig folder does not exist. Create it 
if [ ! -d ~/preconfig ]
then
	mkdir ~/preconfig
fi
## If preconfig/commands folder does not exist. Create it 
if [ ! -d ~/preconfig/commands ]
then
	mkdir ~/preconfig/commands
fi
## If preconfig/commands/commands.sh file does not exist. Create it 
if [ ! -d ~/preconfig/commands/commands.sh ]
then
	touch ~/preconfig/commands/commands.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/commands.sh | sudo tee -a ~/preconfig/commands/commands.sh 
fi

## If preconfig/gitconfig folder does not exist. Create it 
if [ ! -d ~/preconfig/gitconfig ]
then
	mkdir ~/preconfig/gitconfig 
fi

## If preconfig/backup folder does not exist. Create it 
if [ ! -d ~/preconfig/backup ]
then
	mkdir ~/preconfig/backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ ! -f ~/preconfig/backup/.bashrc.backup ]
then
	mv -f ~/.bashrc.backup ~/preconfig/backup/.bashrc.backup 
fi
## If .bashrc.backup file in in preconfig/backup folder does not exist. Copy from root folder to.
if [ -f ~/.bashrc.backup ]
then
	rm -f ~/.bashrc.backup 
fi

if [ ! -f ~/preconfig/gitconfig/gitPushOriginMain.sh ]
then
	touch  ~/preconfig/gitconfig/gitPushOriginMain.sh && curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/gitPushOriginMain.sh| sudo tee -a ~/preconfig/gitconfig/gitPushOriginMain.sh  
fi

cat << EOF | sudo tee -a ~/.bashrc

### User specific aliases and functions

alias rm='rm -f'
alias cp='cp -rf'
alias mv='mv -f'

### Linux command

alias ll='ls -la '
alias lr='ll ~ '
alias lll='ll /'
alias lbk='ll ~/preconfig/backup'
alias cdl='cd / '
alias cdtb='cd ~/Terraform/bash '
alias lh='ll /home'
alias cdh='cd /home'
alias cdb='cd /bin'
alias letc='ll /etc'
alias cdetc='cd /etc'
alias lbin='ll /usr/local/bin '
alias lrp='ll /etc/yum.repos.d'
alias cdrp='cd /etc/yum.repos.d'
alias md='mkdir '
alias rf='rm -rf '
alias rm='rm -f '
alias hoi='hostname -i '
alias hs='hostnamectl status '
alias hi='history '
alias hz='hi | tail -n 10 '
alias h2='hi | tail -n 20 '
alias cl='clear '
alias cb='cd ..'
alias cb2='cd ../..'
alias cb3='cd ../../..'
alias val='vi ~/.bashrc'
alias vicp='vi ./docker-compose.yaml'
alias vidk='vi ./Dockerfile'
alias vbbk='vi ~/preconfig/backup/.bashrc.backup'
alias vvbk='vi ~/preconfig/backup/.vimrc.backup'
alias vrc='vi ~/.vimrc'
alias va='vi alias.sh'
alias vdel='vi delete.sh'
alias vdel2='vi delete2.sh'
alias vdel3='vi delete3.sh'
alias vcf='vi vimconfig.sh'
alias vrcu='vi ~/preconfig/.vimrc'
alias vrco='vi ~/preconfig/previmrc'
alias viid='vi ~/.ssh/id_ed25519'
alias visu='vi /etc/sudoers.d'
alias ed400='c400 ~/.ssh/id_ed25519'
alias eb='exec bash '
alias cos='cat /etc/os-release '
alias lssh='ll /root/.ssh '
alias rn='route -n '
alias ir='ip route '
alias ex='exit '
alias 25519del='rm -f  ~/.ssh/id_ed25519* '
alias 25519gen='ssh-keygen -t ed25519 -C '
alias 25519pu='cat ~/.ssh/id_ed25519.pub '
alias 25519pr='cat ~/.ssh/id_ed25519'
alias rv='. ~/preconfig/run.sh '
alias cdf='. ~/preconfig/commands/commands.sh'
alias rr='. ~/.bashrc '
alias b0='cp -f ~/.bashrc ~/.bashrc~ '
alias b1='rm ~/.bashrc'
alias b2='cp -f  ~/.bashrc~ ~/.bashrc '
alias cdssh='cd /root/.ssh '
alias c400='chmod 400 '
alias c200='chmod 200 '
alias c300='chmod 300 '
alias c600='chmod 600 '
alias c700='chmod 700 '
alias c500='chmod 500 '
alias c100='chmod 100 '
alias c777='chmod 777 '
alias up1='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/alias.sh ) '
alias up2='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/vimconfig.sh) '
alias dall='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/delete.sh) '
alias dall2='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/delete2.sh) '
alias dall3='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/delete3.sh) '
alias mu='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/master-ubuntu.sh )'
alias wu='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/worker-ubuntu.sh )'
alias mc='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/master-centos.sh )'
alias wc='bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/worker-centos )'


### Git command

alias gi='git init'
alias gcl='git clone '
alias gT='git clone git@github.com:haquocdat543/Terraform.git'
alias gA='git clone git@github.com:haquocdat543/ArgoCD.git'
alias gc='git commit -m '
alias gcu='git commit -m "Update"'
alias gs='git status '
alias ga='git add '
alias gaa='git add . '
alias g1='git reset --soft HEAD~1 '
alias g0='git reset --hard HEAD~1 '
alias g2='git reset -- '
alias g3='git restore -- '
alias g4='git restore --source=HEAD '
alias g5='git restore --source='
alias grv='git revert '
alias g6='git revert HEAD '
alias gct='git rev-list --count '
alias gca='git rev-list --count --all '
alias gco='git count-objects'
alias gcov='git count-objects -v'
alias gb='git branch '
alias gbm='git branch -M'
alias gbd='git branch -D '
alias gsw='git switch '
alias gcb='git checkout -b '
alias gck='git checkout '
alias gm='git merge '
alias grb='git rebase '
alias gl='git log '
alias glo='git log --oneline'
alias glo10='git log -n 10 --oneline '
alias gl10='git log -n 10 '
alias glog='git log --oneline --graph '
alias gp='git push '
alias gpom='git push origin main'
alias gall='. ~/preconfig/gitconfig/gitPushOriginMain.sh '
alias gr='git remote '
alias gpl='git pull '
alias gf='git fetch'
alias gra='git remote add '
alias gsl='git stash list '
alias gss='git stash save '
alias gsd='git stash drop '
alias gssh='git stash show '
alias gcn='git config --global user.name '
alias gce='git config --global user.email '

### Docker command

alias do='docker '
alias dcp='docker-compose '
alias dl='docker logs '
alias dlg='docker login'
alias dnl='docker network ls '
alias dnc='docker network create '
alias dncn='docker network connect '
alias dpsn='docker ps -a -q '
alias dps='docker ps -a'
alias dvl='docker volume ls '
alias dvc='docker volume create '
alias dvr='docker volume rm '
alias dr='docker run '
alias drit='docker run -it '
alias dritrm='docker run -it --rm '
alias da='docker attach '
alias de='docker exec -it '
alias drm='docker rm -f '
alias dm='docker image '
alias dms='docker images'
alias dmr='docker image rm '
alias dpl='docker pull'
alias ds='docker search '
alias dnls='docker node ls '
alias dsps='docker service ps '
alias dsl='docker service ls '
alias dstl='docker stack ls'
alias dsc='docker service create '
alias dsr='docker service rm '
alias dsu='docker service update '
alias dstd='docker stack deploy -c '
alias dstr='docker stack rm '
alias db='docker build -f Dockerfile . -t '
alias dt='docker tag '
alias dlg='docker login'
alias dp='docker push '
alias dswi='docker swarm init --advertise-addr='
alias djm='docker swarm join-token manager '
alias djw='docker swarm join-token worker '

### Kubectl command

alias k='kubectl '
alias des='describe '
alias de='delete '
alias km='kubeadm '
alias kx='kubectl exec -it '
alias kq='kubectl describe quota '
alias kgp='kubectl get pod '
alias kgn='kubectl get node '
alias kgs='kubectl get svc '
alias kgd='kubectl get deploy '
alias kgcm='kubectl get configmap '
alias kgrc='kubectl get rc '
alias kgrs='kubectl get rs '
alias kgsts='kubectl get sts '
alias kgds='kubectl get ds '
alias kgsc='kubectl get secret '
alias kgc='kubectl get storageclasses'
alias kgpv='kubectl get pv '
alias kgpvc='kubectl get pvc '
alias kgr='kubectl get role '
alias kgrb='kubectl get rolebindings '
alias kgcr='kubectl get clusterroles '
alias kgcb='kubectl get clusterrolebindings '
alias kgi='kubectl get ingress '
alias kgr='kubectl get role '
alias kgnp='kubectl get networkpolicies '
alias kgsa='kubectl get serviceaccount '
alias kgpsp='kubectl get podsecuritypolicies '

alias kdesp='kubectl describe pod '
alias kdesn='kubectl describe node '
alias kdess='kubectl describe svc '
alias kdesd='kubectl describe deploy '
alias kdescm='kubectl describe configmap '
alias kdesrc='kubectl describe rc '
alias kdesrs='kubectl describe rs '
alias kdessts='kubectl describe sts '
alias kdesds='kubectl describe ds '
alias kdessc='kubectl describe secret '
alias kdesc='kubectl describe storageclasses'
alias kdespv='kubectl describe pv '
alias kdespvc='kubectl describe pvc '
alias kdesr='kubectl describe role '
alias kdesrb='kubectl describe rolebindings '
alias kdescr='kubectl describe clusterroles '
alias kdescb='kubectl describe clusterrolebindings '
alias kdesi='kubectl describe ingress '
alias kdesr='kubectl describe role '
alias kdesnp='kubectl describe networkpolicies '
alias kdesa='kubectl describe serviceaccount '
alias kdespsp='kubectl describe podsecuritypolicies '

alias kdp='kubectl delete pod '
alias kdn='kubectl delete node '
alias kds='kubectl delete svc '
alias kdd='kubectl delete deploy '
alias kdcm='kubectl delete configmap '
alias kdrc='kubectl delete rc '
alias kdrs='kubectl delete rs '
alias kdsts='kubectl delete sts '
alias kdds='kubectl delete ds '
alias kdsc='kubectl delete secret '
alias kdc='kubectl delete storageclasses'
alias kdpv='kubectl delete pv '
alias kdpvc='kubectl delete pvc '
alias kdr='kubectl delete role '
alias kdrb='kubectl delete rolebindings '
alias kdcr='kubectl delete clusterroles '
alias kdcb='kubectl delete clusterrolebindings '
alias kdi='kubectl delete ingress '
alias kdr='kubectl delete role '
alias kdnp='kubectl delete networkpolicies '
alias kdsa='kubectl delete serviceaccount '
alias kdpsp='kubectl delete podsecuritypolicy '

alias kpp='kubectl patch pod '
alias kpn='kubectl patch node '
alias kps='kubectl patch svc '
alias kpd='kubectl patch deploy '
alias kpcm='kubectl patch configmap '
alias kprc='kubectl patch rc '
alias kprs='kubectl patch rs '
alias kpsts='kubectl patch sts '
alias kpds='kubectl patch ds '
alias kpsc='kubectl patch secret '
alias kpc='kubectl patch storageclasses'
alias kppv='kubectl patch pv '
alias kppvc='kubectl patch pvc '
alias kpr='kubectl patch role '
alias kprb='kubectl patch rolebindings '
alias kpcr='kubectl patch clusterroles '
alias kpcb='kubectl patch clusterrolebindings '
alias kpi='kubectl patch ingress '
alias kpr='kubectl patch role '
alias kpnp='kubectl patch networkpolicies '
alias kpsa='kubectl patch serviceaccount '
alias kppsp='kubectl patch podsecuritypolicy '

alias kep='kubectl edit pod '
alias ken='kubectl edit node '
alias kes='kubectl edit svc '
alias ked='kubectl edit deploy '
alias kecm='kubectl edit configmap '
alias kerc='kubectl edit rc '
alias kers='kubectl edit rs '
alias kests='kubectl edit sts '
alias keds='kubectl edit ds '
alias kesc='kubectl edit secret '
alias kec='kubectl edit storageclass '
alias kepv='kubectl edit pv '
alias kepvc='kubectl edit pvc '
alias ker='kubectl edit role '
alias kerb='kubectl edit rolebindings '
alias kecr='kubectl edit clusterroles '
alias kecb='kubectl edit clusterrolebindings '
alias kei='kubectl edit ingress '
alias ker='kubectl edit role '
alias kenp='kubectl edit networkpolicy '
alias kesa='kubectl edit serviceaccount '
alias kepsp='kubectl edit podsecuritypolicy '

alias kge='kubectl get event '
alias ktn='kubectl taint node '

alias kl='kubectl logs '
alias kn='kubectl config set-context --current --namespace '
alias kgns='kubectl get namespace '
alias kgct='kubectl config get-contexts '
alias kr='kubectl run --dry-run=client -oyaml --image '
alias ka='kubectl apply -f '
alias kd='kubectl delete -f '

### Other command


alias s1='sudo su - '
alias s2='su - ec2-user'
alias s2='su - ubuntu'
alias yi='yum install -y '
alias ni='npm install '
alias yu='yum update -y '
alias ai='apt install -y '
alias au='apt update -y '
alias se='systemctl enable '
alias ss='systemctl start '
alias sr='systemctl restart '
alias yma='yum-config-manager --add-repo '
alias yme='yum-config-manager --enable '
alias darp='dnf config-manager --add-repo '
alias ynv='yum install -y neovim '
alias yd='yum install docker -y '
alias yn='yum install nodejs -y '
alias ynpm='yum install npm -y ' 
alias yg='yum install git -y '
alias ygcc='yi gcc'
alias ad='ai docker.io'
alias ag='ai git'
alias agcc='ai gcc'
alias snd='snap install docker'
alias ed='systemctl enable docker '
alias sd='systemctl start docker '
alias chx='sudo chmod +x '
alias chxdc='sudo chmod +x /usr/local/bin/docker-compose '
alias idc='sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose'

EOF

exec bash

clear
