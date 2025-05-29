Puppet::Type.newtype(:clone) do
  @doc = "Clone Git repositories."

  ensurable
 
  newparam(:path) do
    desc "Destination path"

    validate do |value|
      unless value =~ /^\/[a-z0-9]+/
        raise ArgumentError , "%s is not a valid file path" % value
      end
    end

    isnamevar

  end

  newparam(:source) do
    desc "Repository source"

    validate do |value|
      unless value =~ /^(git|https)/
        raise ArgumentError , "%s is not a valid repository source" % value
      end
    end

  end

  newparam(:branch) do
    desc "Repository branch"

    validate do |value|
      unless value =~ /[a-z0-9]+/
        raise ArgumentError , "%s is not a valid branch name" % value
      end
    end

  end

  newproperty(:pull) do
    desc "Pull changes from the source"

    defaultto :no
    newvalues(:yes, :no)
  end

end
