class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :form
      t.belongs_to :question_type
      t.text :text

      t.timestamps
    end
  end
end
