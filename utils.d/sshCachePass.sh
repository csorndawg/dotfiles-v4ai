# Runner script for ssh key cred caching

cache_ssh_pass() {

  # Set defaults if no runtime vars are given
  if [ -n "$1" ] && [ -n "$2" ]; then
    local sshkey_path="$1"
    local sshkey_passphrase="$2"
  else
    local sshkey_path="$HOME/.ssh/id_rsa"
    local sshkey_passphrase="messi10"
  fi

  echo "SSH Key: $sshkey_path"
  echo "Passphrase: $sshkey_passphrase"

  expect "$HOME/.ssh/sshCachePass.expect" "$sshkey_path" "$sshkey_passphrase"
  expect "$HOME/.ssh/sshCachePass.expect" "$sshkey_path" "$sshkey_passphrase"
}

#eval "$(ssh-agent -s)"
# cache id_rsa (default)
cache_ssh_pass $1 $2

zc1_keypath="$HOME/.ssh/id_rsa_z1"
zc1_pwd="zac"
cache_ssh_pass "$zc1_keypath" "$zc1_pwd"

linode_keypath="$HOME/.ssh/id_rsa_linode"
linode_pwd="zac"
cache_ssh_pass "$linode_keypath" "$linode_pwd"


echo "Done caching ssh key credentials"
