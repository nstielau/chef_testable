# Test that ntpd process is around
testable "ntpd process should be around" do
  command "ps aux | grep ntpd"
  action :test
end

# Test another command, and export to a test script, which you can run later.
testable "iptables should be running" do
  command "/etc/init.d/iptables status"
  export :type => :shell, :path => '/tmp/chef_testables_another_service'
  action [:test, :export]
end

# Only test if some has changed (immediately or delayed)
file "/tmp/booyeah" do
  content "booyeahbobmarley"
  notifies :test, "testable[check_for_booyeah]", :delayed
end

testable "check_for_booyeah" do
  command "grep booyeah /tmp/booyeah"
  action :nothing
end

