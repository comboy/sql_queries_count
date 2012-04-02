
module SqlQueriesCount

  module ControllerRuntime

    extend ActiveSupport::Concern

    protected

      attr_internal :db_runtime

      def process_action(action, *args)
        QueryCounter.reset_counter
        super
      end

      def append_info_to_payload(payload)
        super
        if ActiveRecord::Base.connected?
          payload[:db_query_count] = QueryCounter.reset_counter
        end
      end


    module ClassMethods
      def log_process_action(payload)
        messages, sql_count = super, payload[:db_query_count]
        messages << ("SQL count: %d" % sql_count) if sql_count
        messages
      end
    end

  end

end

