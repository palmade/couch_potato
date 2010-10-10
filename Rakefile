require 'rubygems'
gem 'echoe'
require 'echoe'

Echoe.new("couch_potato") do |p|
  p.author = "palmade"
  p.project = "palmade"
  p.summary = "Rack yet-another-session-manager (supports redis)"

  p.dependencies = [ ]

  p.need_tar_gz = false
  p.need_tgz = true

  p.clean_pattern += [ "pkg", "lib/*.bundle", "*.gem", ".config" ]
  p.rdoc_pattern = [ 'README', 'LICENSE', 'COPYING', 'lib/**/*.rb', 'doc/**/*.rdoc' ]
end
