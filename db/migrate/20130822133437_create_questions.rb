class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :form
      t.belongs_to :question_type
      t.text :statement

      t.timestamps
    end
  end
end
