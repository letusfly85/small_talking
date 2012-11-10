class KrSchedule < ActiveRecord::Base
  attr_accessible :end_time, :lesson_date, :location, :start_time, :user_id
end
