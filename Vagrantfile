# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "centos/7"

  # Use default vagrant network setting
  #config.vm.network "private_network", ip: "10.0.10.15", netmask: "24"

  config.vm.synced_folder "vagrant", "/vagrant", disabled: true
  if Vagrant::Util::Platform.windows?
    # default windows share (SMB)
    config.vm.synced_folder ".vscode", "/home/vagrant/nemea-repo/.vscode"
  elsif Vagrant.has_plugin?("vagrant-sshfs") then
    config.vm.synced_folder ".vscode", "/home/vagrant/nemea-repo/.vscode", type: "sshfs"

    if File.directory?(File.expand_path("./nemea-repo"))
      config.vm.synced_folder "nemea-repo", "/home/vagrant/nemea-repo/", type: "sshfs"
    else
      config.vm.synced_folder "nemea-repo", "/home/vagrant/nemea-repo/", type: "sshfs", reverse: true
    end
  else
    config.vm.synced_folder ".vscode", "/home/vagrant/nemea-repo/.vscode", type: "rsync"
  end

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:

   config.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
   end
   config.vm.provider "libvirt" do |vb|
      # Display the VirtualBox GUI when booting the machine
      # vb.gui = true

      # Customize the amount of memory on the VM:
      vb.memory = "2048"
   end
  # Install dependencies, DISTANCE system, simple GUI
  config.vm.provision "shell", path: "scripts/install-centos.sh"
  config.vm.provision "shell", inline: "chown vagrant:vagrant /home/vagrant/*"
  config.vm.provision "shell", path: "scripts/install-nemea.sh", privileged: false
end
