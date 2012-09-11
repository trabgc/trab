class Variable < ActiveRecord::Base
  attr_accessible :description
  has_many :values
end
