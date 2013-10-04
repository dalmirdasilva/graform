class CreateFormTypes < ActiveRecord::Migration
  def change
    create_table :form_types do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
