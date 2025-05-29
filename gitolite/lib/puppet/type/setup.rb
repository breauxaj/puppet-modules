Puppet::Type.newtype(:setup) do
  @doc = "Setup Gitolite"

  ensurable do
    desc "Setup Gitolite. Valid values are: present, absent."

    defaultto(:present)

    newvalue(:present) do
      provider.create
    end

    newvalue(:absent) do
      provider.destroy
    end
  end
 
  newparam(:user) do
    desc "User to own gitolite"

    isnamevar

  end

  newparam(:pubkey) do
    desc "Gitolite admin public key"

  end

end
