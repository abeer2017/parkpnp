class Request < ApplicationRecord
  validates_presence_of :start_time, :end_time
  validates_date :start_time, :on => :create, :on_or_after => :today, :on_or_after_message => 'must be after opening time'
  validates_datetime :end_time, :after => :start_time
  
  #Concern
  include Bookable  
  
  
end
