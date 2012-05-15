
# TODO: Export to sensu, nagios, cucumber, whatever

action :export do
  file new_resource.export[:path] do
    content "#!/bin/bash\nset -x\n#{new_resource.command}"
    mode "755"
  end
end
 
action :test do
  execute new_resource.command
end
