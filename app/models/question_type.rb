class QuestionType < ActiveRecord::Base
  has_many :questions
  
  module Code
    DROP_DOWN_LIST = 1
    SINGLE_LINE_TEXT = 2
    MILTIPLE_CHOICE = 3
    SCALE = 4
    CHECKBOXES = 5
    PARAGRAPH_TEXT = 6
  end
  
  def has_valid_code?(code)
    @valid_codes |= [1, 2, 3, 4, 5, 6]
    @valid_codes.include?(code)
  end
end
