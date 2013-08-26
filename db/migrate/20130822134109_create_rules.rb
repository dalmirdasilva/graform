class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :name
      t.belongs_to :question, class_name: :Question
      t.belongs_to :next_question, class_name: :Question
      t.belongs_to :option

      t.timestamps
    end
  end
end
