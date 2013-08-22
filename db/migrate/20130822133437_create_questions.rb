class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :form
      t.string :statement

      t.timestamps
    end
  end
end
