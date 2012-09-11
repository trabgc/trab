class System < ActiveRecord::Base
  attr_accessible :description, :premise_id
  
  has_many :rules
end
