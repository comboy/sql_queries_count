module SqlQueriesCount

  class QueryCounter < ActiveSupport::LogSubscriber
    def self.counter=(value)
      Thread.current["active_record_sql_count"] = value
    end

    def self.counter
      Thread.current["active_record_sql_count"] ||= 0
    end

    def self.reset_counter
     rt, self.counter = counter, 0
     rt
    end

    def initialize
      super
    end

    def sql(event)
      self.class.counter += 1
    end
  end

end


