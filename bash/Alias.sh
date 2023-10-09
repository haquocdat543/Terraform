#!/bin/bash

## Run bash from internet using following command: bash <(curl -s https://raw.githubusercontent.com/haquocdat543/Terraform/main/bash/Alias.sh )

cat << EOF | sudo tee -a ~/.bashrc

## Linux command

alias ll='ls -la '
alias lll='ls -lrt '
alias md='mkdir '
alias rf='rm -rf '
alias hi='hostname '
alias hs='hostname '

## Git command

alias gcl='git clone '
alias gc='git commit -m '
alias gs='git status '
alias ga='git add '
alias gaa='git add . '
alias g1='git reset --soft HEAD~1 '
alias g0='git reset --hard HEAD~1 '
alias g2='git reset -- '
alias g3='git restore -- '
alias gb='git branch '
alias gsw='git switch '
alias gcb='git checkout -b '
alias gck='git checkout '
alias gl='git log '
alias glo='git log --oneline'
alias glog='git log --oneline --graph '
alias gp='git push '
alias gr='git remote '
alias gra='git remote add '
alias gsl='git stash list '
alias gss='git stash save '
alias gsd='git stash drop '
alias gssh='git stash show '
alias gcn='git config --global user.name '
alias gce='git config --global user.email '

## Docker command

alias do='docker '
alias dcp='docker-compose '
alias dl='docker logs '
alias dnl='docker network ls '
alias dnc='docker network create '
alias dncn='docker network connect '
alias dpsn='docker ps -a -q '
alias dps='docker ps -a'
alias dvl='docker volume ls '
alias dvc='docker volume create '
alias dvr='docker volume rm '
alias dr='docker run '
alias da='docker attach '
alias de='docker exec -it '
alias drm='docker rm -f '
alias dm='docker image '
alias dms='docker images'
alias dmr='docker image rm '
alias dp='docker pull'
alias ds='docker search '
alias dnls='docker node ls '
alias dsps='docker service ps '
alias dsc='docker service create '
alias dsr='docker service rm '
alias dstd='docker stack deploy -c '
alias dstr='docker stack rm '
alias db='docker build -f . -t '
alias dbf='docker build -t '
alias dt='docker tag '
alias dpsh='docker push '
alias dswi='docker swarm init --advertise-addr= '

## Kubectl command

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

## Other command

alias s1='sudo su - '
alias yi='yum install -y '
alias yu='yum update -y '
alias ai='apt install -y '
alias au='apt update -y '
alias se='systemctl enable '
alias ss='systemctl start '
alias sr='systemctl restart '
alias yd='yum install docker -y '
alias yg='yum install git -y '
alias ed='systemctl enable docker '
alias sd='systemctl start docker '
EOF

. ~/.bashrc

