require 'fileutils'

Puppet::Type.type(:clone).provide(:git) do
  desc "GIT Support"

  commands :git => 'git'

  def create
    if resource[:branch]
      git 'clone', resource[:source], '-b', resource[:branch], resource[:name]
    else
      git 'clone', resource[:source], resource[:name]
    end
  end

  def destroy
    FileUtils.rm_rf resource[:name]
  end

  def exists?
    File.directory? resource[:name]
  end

  def pull
    Dir.chdir resource[:name]
    status = git('status')
    if status =~ /up-to-date/
      $1
    end
  end

  def pull=(value)
    Dir.chdir resource[:name]
    git 'pull'
  end


end
