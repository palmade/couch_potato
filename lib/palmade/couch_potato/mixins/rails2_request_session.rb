module Palmade
  module CouchPotato
    module Mixins
      module Rails2RequestSession
        def global_session
          @env['rack.session.global'] ||= { }
        end

        def session_global_options
          @env['rack.session.global.options'] ||= { }
        end

        def reset_session_with_couch_potato(sid = nil)
          mw = @env['rack.session.middleware']
          so = session_options

          sd = nil
          unless sid.nil?
            sd = mw.use_session(sid)
          end

          # let's save the last known session id, so we can delete it!
          unless so[:id].nil?
            so[:reset] = true
            so[:old_id] = so[:id]
            so[:old_sd] = @env['rack.session']
          end
          so.delete(:id)

          if sd.nil?
            sd = @env['rack.session'] = mw.new_session
            mw.preempt_sid(sd.session_id,
                           so[:expire_after] || so[:cache_expire_after])
          else
            so[:id] = sd.session_id
            @env['rack.session'] = sd
          end

          @env['rack.session'].global = @env['rack.session.global']

          session
        end

        def reset_global_session(sid = nil)
          mw = @env['rack.session.global.middleware']
          sgo = session_global_options

          sd = nil
          unless sid.nil?
            sd = mw.use_session(sid)
          end

          # let's save the last known session id, so we can delete it!
          unless sgo[:id].nil?
            sgo[:reset] = true
            sgo[:old_id] = sgo[:id]
            sgo[:old_sd] = @env['rack.session.global']
          end
          sgo.delete(:id)

          if sd.nil?
            sd = @env['rack.session.global'] = mw.new_session
            mw.preempt_sid(sd.session_id,
                           sgo[:expire_after] || sgo[:cache_expire_after])

          else
            sgo[:id] = sd.session_id
            @env['rack.session.global'] = sd
          end

          @env['rack.session'].global = @env['rack.session.global']

          sd
        end

        def drop_session
          session_options[:drop] = true
        end

        def drop_global_session
          session_global_options[:drop] = true
        end

        def renew_session
          session_options[:renew] = true
        end

        def renew_global_session
          session_global_options[:renew] = true
        end

        def self.included(base)
          base.class_eval do
            alias_method_chain :reset_session, :couch_potato
          end
        end
      end
    end
  end
end
