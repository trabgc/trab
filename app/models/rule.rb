class Rule < ActiveRecord::Base
  attr_accessible :description, :system_id
  
  has_many :premises
  has_many :conclusions
  
  belongs_to :system
end
