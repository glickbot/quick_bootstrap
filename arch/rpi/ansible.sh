#!/bin/bash
pacman -Syu --noconfirm
pacman -S --noconfirm git python2 python2-paramiko python2-pip libyaml
easy_install-2.7 PyYAML jinja2
git clone git://github.com/ansible/ansible.git /usr/local/ansible

mkdir /etc/ansible
mkdir /etc/ansible/group_vars

cat <<EOF1 > /etc/ansible/hosts
[local]
127.0.0.1 ansible_connection=local
EOF1

cat <<EOF2 > /etc/ansible/group_vars/all
---
ansible_python_interpreter: /usr/local/bin/python
EOF2

ln -sf  /usr/bin/python2 /usr/local/bin/python

cat <<EOF2 > /etc/profile.d/ansible.sh
ANSIBLE="/usr/local/ansible"
export PATH=/usr/local/bin:$ANSIBLE/bin:$PATH
export PYTHONPATH=$ANSIBLE/lib:$PYTHONPATH
export ANSIBLE_LIBRARY=$ANSIBLE/library
export MANPATH=$ANSIBLE/docs/man:$MANPATH
EOF3
