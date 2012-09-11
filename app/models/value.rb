class Value < ActiveRecord::Base
  attr_accessible :description, :variable_id
  
  belongs_to :variable
end
