class AddCodeToQuestionTypes < ActiveRecord::Migration
  def change
	add_column :question_types, :code, :integer
  end
end
