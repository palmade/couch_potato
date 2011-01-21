# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{couch_potato}
  s.version = "0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["palmade"]
  s.date = %q{2010-10-10}
  s.description = %q{Rack yet-another-session-manager (supports redis)}
  s.email = %q{}
  s.extra_rdoc_files = ["README", "lib/palmade/couch_potato.rb", "lib/palmade/couch_potato/helpers.rb", "lib/palmade/couch_potato/helpers/rails2_helper.rb", "lib/palmade/couch_potato/helpers/rails_helper.rb", "lib/palmade/couch_potato/mixins.rb", "lib/palmade/couch_potato/mixins/cgi_app_session.rb", "lib/palmade/couch_potato/mixins/rails1_action_controller_base.rb", "lib/palmade/couch_potato/mixins/rails1_action_controller_cgi_request.rb", "lib/palmade/couch_potato/mixins/rails2_action_controller_base.rb", "lib/palmade/couch_potato/mixins/rails2_request_session.rb", "lib/palmade/couch_potato/mixins/session_use_memcache.rb", "lib/palmade/couch_potato/mixins/session_use_redis.rb", "lib/palmade/couch_potato/pots.rb", "lib/palmade/couch_potato/session.rb", "lib/palmade/couch_potato/session_data.rb", "lib/palmade/couch_potato/session_flash.rb", "lib/palmade/couch_potato/session_fragments.rb", "lib/palmade/couch_potato/session_user.rb"]
  s.files = ["CHANGELOG", "README", "Rakefile", "lib/palmade/couch_potato.rb", "lib/palmade/couch_potato/helpers.rb", "lib/palmade/couch_potato/helpers/rails2_helper.rb", "lib/palmade/couch_potato/helpers/rails_helper.rb", "lib/palmade/couch_potato/mixins.rb", "lib/palmade/couch_potato/mixins/cgi_app_session.rb", "lib/palmade/couch_potato/mixins/rails1_action_controller_base.rb", "lib/palmade/couch_potato/mixins/rails1_action_controller_cgi_request.rb", "lib/palmade/couch_potato/mixins/rails2_action_controller_base.rb", "lib/palmade/couch_potato/mixins/rails2_request_session.rb", "lib/palmade/couch_potato/mixins/session_use_memcache.rb", "lib/palmade/couch_potato/mixins/session_use_redis.rb", "lib/palmade/couch_potato/pots.rb", "lib/palmade/couch_potato/session.rb", "lib/palmade/couch_potato/session_data.rb", "lib/palmade/couch_potato/session_flash.rb", "lib/palmade/couch_potato/session_fragments.rb", "lib/palmade/couch_potato/session_user.rb", "Manifest", "couch_potato.gemspec"]
  s.homepage = %q{}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Couch_potato", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{palmade}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Rack yet-another-session-manager (supports redis)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
