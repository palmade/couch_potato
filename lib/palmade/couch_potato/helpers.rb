module Palmade::CouchPotato
  module Helpers
    autoload :RailsHelper, File.join(COUCH_POTATO_LIB_DIR, 'couch_potato/helpers/rails_helper')
    autoload :Rails2Helper, File.join(COUCH_POTATO_LIB_DIR, 'couch_potato/helpers/rails2_helper')

    def self.use(helper_module)
      const_get(helper_module)
    end
  end
end
