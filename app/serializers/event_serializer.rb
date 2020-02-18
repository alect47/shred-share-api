class EventSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :details, :start_time, :finish_time
end
