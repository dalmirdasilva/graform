class SeedFormTypes < ActiveRecord::Migration

  @@form_types = [
    {id: 1, name: 'conditional', code: 1},
    {id: 2, name: 'continuous', code: 2}
  ]

  def up
    @@form_types.each do |form_type_entry|
      @form_type = FormType.new
      @form_type.id = form_type_entry[:id]
      @form_type.name = form_type_entry[:name]
      @form_type.code = form_type_entry[:code]
      raise "Unable to save form type when seeding." unless @form_type.save
    end
  end
  
  def down
    FormType.destroy_all
  end
end
