# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

# Redirect from docs.pivotal.io/credhub to docs.vmware.com CredHub docs in TAS v4.0
r301  %r{/credhub/index.html}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/4.0/tas-for-vms/credhub-index.html"
r301  %r{/credhub/([\w-]*\.html)}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/4.0/tas-for-vms/$1"
r301  %r{/credhub/}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/4.0/tas-for-vms/credhub-index.html"
r301  %r{/credhub}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/4.0/tas-for-vms/credhub-index.html"
