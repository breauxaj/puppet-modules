Puppet::Type.type(:setup).provide(:ruby) do
  desc "Setup Gitolite"

  commands :su => 'su'

  def create
    File.open('/tmp/gitolite.pub', 'w') { |file| file.write( resource[:pubkey] ) }

    su '-', resource[:name], '-c', "\'/usr/bin/gitolite setup -pk /tmp/gitolite.pub\'"
    
    File.delete ('/tmp/gitolite.pub')
  end

  def destroy
    repos = File.expand_path( '~' + resource[:name] + '/repositories')
    
    FileUtils.rm_rf repos
  end

  def exists?
    admin = File.expand_path( '~' + resource[:name] + '/repositories/gitolite-admin.git')

    if Dir.exists? admin
      return true
    else
      return false
    end
  end

end
