execute "update package list" do
  command "sudo apt-get update -y"
  ignore_failure true
end

node.default["rethinkdb"]["version"] = "2.0.0"
include_recipe "rethinkdb"
include_recipe "rethinkdb::start"
