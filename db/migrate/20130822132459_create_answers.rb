class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    
      t.belongs_to :reply
      t.belongs_to :question
      t.belongs_to :option

      t.timestamps
    end
  end
end
