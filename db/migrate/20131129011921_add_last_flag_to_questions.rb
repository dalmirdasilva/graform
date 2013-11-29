class AddLastFlagToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :is_last, :boolean
  end
end
