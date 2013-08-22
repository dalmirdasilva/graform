class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.belongs_to :question
      t.string :name

      t.timestamps
    end
  end
end
