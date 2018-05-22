if os.name == 'debian' || os.name == 'ubuntu'
  describe file('/etc/apt/sources.list') do
    it { should be_file }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 0644 }
    its(:content) do
      should match "Generated by Chef"
      should match "deb http://us.archive.ubuntu.com/ubuntu xenial main restricted universe multiverse"
      should match "deb http://us.archive.ubuntu.com/ubuntu xenial-updates main restricted universe multiverse"
      should match "deb http://security.ubuntu.com/ubuntu xenial-security main restricted universe multiverse" 
      should_not match "/archive.ubuntu.com/" 
    end
  end
end
