if node[:platform] == 'ubuntu'

  package 'apache2' do
    action :install
  end

  remote_file "/var/www/apache2/webapps/benefits.war" do
    source 'https://www.oracle.com/webfolder/technetwork/tutorials/obe/fmw/wls/12c/03-DeployApps/files/benefits.war'  
    action :create
  end

  service "apache2" do
    action [:enable, :start]
  end

end

if node[:platform] == 'amazon'

  package 'httpd' do
    action :install
  end
  
  service 'httpd' do
    action [:enable, :start]
  end

end
