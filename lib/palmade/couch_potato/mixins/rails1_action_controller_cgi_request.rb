module Palmade
  module CouchPotato
    module Mixins
      module Rails1ActionControllerCgiRequest
        def initialize_with_couch_potato(*args)
          initialize_without_couch_potato(*args)

          @session_options = @env['rack.session.options'] = @env['rack.session.options'] || { }
          @session_global_options = @env['rack.session.global.options'] = @env['rack.session.global.options'] || { }
        end

        def session_with_couch_potato
          @env['rack.session'] ||= { }
        end

        def global_session
          @env['rack.session.global'] ||= { }
        end

        def reset_session_with_couch_potato(sid = nil)
          mw = @env['rack.session.middleware']
          sd = nil
          unless sid.nil?
            sd = mw.use_session(sid)
          end

          # let's save the last known session id, so we can delete it!
          unless @session_options[:id].nil?
            @session_options[:reset] = true
            @session_options[:old_id] = @session_options[:id]
            @session_options[:old_sd] = @env['rack.session']
          end
          @session_options.delete(:id)

          if sd.nil?
            sd = @env['rack.session'] = mw.new_session
            mw.preempt_sid(sd.session_id,
                           @session_options[:expire_after] || @session_options[:cache_expire_after])
          else
            @session_options[:id] = sd.session_id
            @env['rack.session'] = sd
          end

          @env['rack.session'].global = @env['rack.session.global']

          sd
        end

        def reset_global_session(sid = nil)
          mw = @env['rack.session.global.middleware']
          sd = nil
          unless sid.nil?
            sd = mw.use_session(sid)
          end

          # let's save the last known session id, so we can delete it!
          unless @session_global_options[:id].nil?
            @session_global_options[:reset] = true
            @session_global_options[:old_id] = @session_global_options[:id]
            @session_global_options[:old_sd] = @env['rack.session.global']
          end
          @session_global_options.delete(:id)

          if sd.nil?
            sd = @env['rack.session.global'] = mw.new_session
            mw.preempt_sid(sd.session_id,
                           @session_global_options[:expire_after] || @session_global_options[:cache_expire_after])

          else
            @session_global_options[:id] = sd.session_id
            @env['rack.session.global'] = sd
          end

          @env['rack.session'].global = @env['rack.session.global']

          sd
        end

        def drop_session
          @session_options[:drop] = true
        end

        def drop_global_session
          @session_global_options[:drop] = true
        end

        def renew_session
          @session_options[:renew] = true
        end

        def renew_global_session
          @session_global_options[:renew] = true
        end

        def session_global_options
          @session_global_options
        end

        def session_options_with_couch_potato
          @session_options
        end

        def session_options_with_couch_potato=(options)
          # ignored!!!
        end

        def self.included(base)
          base.class_eval do
            alias_method_chain :initialize, :couch_potato
            alias_method_chain :session, :couch_potato
            alias_method_chain :reset_session, :couch_potato
            alias_method_chain :session_options, :couch_potato
            alias_method_chain :session_options=, :couch_potato
          end
        end
      end
    end
  end
end
