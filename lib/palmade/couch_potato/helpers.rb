module Palmade::CouchPotato
  module Helpers
    def self.use(helper_name, *args)
      mod = const_get(helper_name)
      if args.size > 0
        mod.setup(*args)
      else
        mod
      end
    end

    autoload :RailsHelper, File.join(COUCH_POTATO_LIB_DIR, 'couch_potato/helpers/rails_helper')
    autoload :Rails2Helper, File.join(COUCH_POTATO_LIB_DIR, 'couch_potato/helpers/rails2_helper')
  end
end
