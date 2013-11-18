class SeedQuestionTypes < ActiveRecord::Migration

  @@question_types = [
    {name: 'single_line', code: 1},
    {name: 'mutiple_choice', code: 2},
    {name: 'checkboxes', code: 3},
    {name: 'paragraph', code: 4}
  ]

  def up
    @@question_types.each do |question_type_entry|
      @question_type = QuestionType.new
      @question_type.name = question_type_entry[:name]
      @question_type.code = question_type_entry[:code]
      raise "Unable to save question type when seeding." unless @question_type.save
    end
  end
  
  def down
    QuestionType.destroy_all
  end
end
