# Redirect all production http traffic to https
r301 %r{.*}, 'https://docs.pivotal.io$&', :if => Proc.new { |rack_env|
  rack_env['SERVER_NAME'] == 'docs.pivotal.io' && rack_env['HTTP_X_FORWARDED_PROTO'] == 'http'
}

r301 %r{/pcf/(.*)}, 'https://docs.pivotal.io/$1'

# Redirect from docs.pivotal.io/nist/index.html to docs.vmware.com NIST docs

r301  %r{/nist/(.*)/(.*)}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/services/nist/$1-$2"

r301  %r{/nist/([\w-]*\.html)}, "hhttps://docs.vmware.com/en/VMware-Tanzu-Application-Service/services/nist/$1"

r301  %r{/nist/}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/services/nist/index.html"
r301  %r{/nist}, "https://docs.vmware.com/en/VMware-Tanzu-Application-Service/services/nist/index.html"
