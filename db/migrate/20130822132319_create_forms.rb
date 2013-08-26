class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
