Vagrant.configure("2") do |config|
    config.vm.box = "generic/ubuntu2204"    
    config.vm.hostname = "JammyJellyfish"
    config.vm.provider "virtualbox"
    config.vm.network :private_network, ip: "192.168.33.101" 

    # para linux e mac
    config.vm.synced_folder("project", "/var/www/html")  
    # config.vm.synced_folder "project", "/var/www/html"     
    
    config.vm.provider "virtualbox" do |machine|
      machine.memory = 2024
      machine.cpus = 2
      machine.name = "JammyJellyfish" 
      # machine.gui = true      
    end

    ## Setup
    # config.vm.provision :shell, path: "setup.sh"
 
    ##Gerar somente projeto laravel
    # config.vm.provision :shell, path: "host/project.sh"
    
    ## Hosts criados, host na pasta host   
    # config.vm.provision :shell, path: "host/ead.sh" 
    config.vm.provision :shell, path: "host/public.sh" 
                 
end
