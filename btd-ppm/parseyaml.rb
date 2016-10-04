# -*- mode: ruby -*-
# vi: set ft=ruby :

# read vm and chef configurations from JSON files
require 'yaml'
require 'pp'
vagrant_yaml = YAML.load_file(File.join(File.dirname(__FILE__), 'vagrant.yml'))
nodes = vagrant_yaml['nodes']

nodes.each do |node, node_details|
  script_folder = "#{node['provisioners']['script_folder']}"
  node['provisioners']['shell'] && node['provisioners']['shell'].each do |key, value|
    pp "#{script_folder}#{value}"
  end
  node['provisioners']['file'] && node['provisioners']['file'].each do |script|
    print "source ", script['source'], "\n"
    print "destination ", script['destination'], "\n" if defined?(script['destination'])
  end
end

pp Random.rand(101..254).to_i
