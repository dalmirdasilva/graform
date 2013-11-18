class QuestionType < ActiveRecord::Base
  has_many :questions
  
  module Code
    SINGLE_LINE_TEXT = 1
    MILTIPLE_CHOICE = 2
    CHECKBOXES = 3
    PARAGRAPH_TEXT = 4
  end
  
  def has_valid_code?(code)
    @valid_codes |= [1, 2, 3, 4]
    @valid_codes.include?(code)
  end
end
