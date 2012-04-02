
module SqlQueriesCount

   class Railtie < Rails::Railtie

     initializer 'sql_queries_count.initialize' do |app|
       SqlQueriesCount::QueryCounter.attach_to :active_record
       ActiveSupport.on_load(:action_controller) do
         include SqlQueriesCount::ControllerRuntime
       end
     end

   end

end
