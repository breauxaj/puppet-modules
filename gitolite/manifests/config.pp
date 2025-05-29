# Define: gitolite::config
#
# This define sets up gitolite for the specified user
#
# Parameters:
#
#  name:
#    User to own the repositories
#
#  pubkey:
#    Public key for the admin of gitolite
#
# Actions:
#   - Stages the public key in /tmp
#   - Runs the gitolite setup as the user specified
#   - Removes the public key from /tmp
#
# Requires:
#
# Sample Usage:
#
#  To configure gitolite, use:
#
#    gitolite::config { 'git':
#      pubkey => ''
#    }
#
define gitolite::config (
  $pubkey
) {
  setup { $name:
    ensure   => present,
    user     => $name,
    pubkey   => $pubkey,
  }

}
