class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.belongs_to :question
      t.belongs_to :option

      t.timestamps
    end
  end
end
