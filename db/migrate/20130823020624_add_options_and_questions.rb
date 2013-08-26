class AddOptionsAndQuestions < ActiveRecord::Migration
  def self.up
    create_table :options_questions do |t|
      t.references :option, :question
    end
  end

  def self.down
    drop_table :options_questions
  end
end

