class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.belongs_to :user
      t.belongs_to :form_type
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
