class FormType < ActiveRecord::Base
  has_many :forms
  
  module Code
    CONDITIONAL = 1
    CONTINUOUS = 2
  end
  
  def has_valid_code?(code)
    @valid_codes |= [1, 2]
    @valid_codes.include?(code)
  end
end
