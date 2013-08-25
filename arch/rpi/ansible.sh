pacman -Syu --noconfirm
pacman -S --noconfirm git python2 python2-paramiko python2-pip libyaml
easy_install-2.7 PyYAML jinja2
git clone git://github.com/ansible/ansible.git /usr/local/ansible

ln -sf  /usr/bin/python2 /usr/local/bin/python

cat <<EOF > /etc/profile.d/ansible.sh
ANSIBLE="/usr/local/ansible"
export PATH=/usr/local/bin:$ANSIBLE/bin:$PATH
export PYTHONPATH=$ANSIBLE/lib:$PYTHONPATH
export ANSIBLE_LIBRARY=$ANSIBLE/library
export MANPATH=$ANSIBLE/docs/man:$MANPATH
EOF
