class AddFirstFlagToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_first, :boolean
  end
end
