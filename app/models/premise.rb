class Premise < ActiveRecord::Base
  attr_accessible :value_id, :variable_id, :rule_id
  
  belongs_to :rule
  
  validates :value_id, :presence => true
  validates :variable_id, :presence => true
  
  validate :validate_value_id
  validate :validate_variable_id
  
  def validate_value_id
    if !(Value.exists?(value_id))
       errors.add(:value_id, "Valor Invalido")
    end
  end
  
  def validate_variable_id
    if !(Variable.exists?(variable_id))
      errors.add(:variable_id, "Variavel Invalida")
    end
  end
  
end
