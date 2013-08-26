class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.belongs_to :form
      
      t.timestamps
    end
  end
end
