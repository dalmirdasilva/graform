namespace :db do

  desc "Db from scratch"
  task fromscratch: :environment do
    puts "Dropping..."
    Rake::Task['db:drop'].invoke
    puts "Creating..."
    Rake::Task['db:create'].invoke
    puts "Migrating..."
    Rake::Task['db:migrate'].invoke
    puts "Creating types..."
    Rake::Task['db:createtypes'].invoke
  end

  desc "Create default types"
  task createtypes: :environment do
    ActiveRecord::Base.connection.execute "TRUNCATE question_types"
    ActiveRecord::Base.connection.execute "TRUNCATE form_types"
    question_types = [
      {name: "Drop down list", code: 1},
      {name: "Single line name", code: 2},
      {name: "Multiple choice", code: 3},
      {name: "Scale", code: 4},
      {name: "Checkboxes", code: 5},
      {name: "Paragraph", code: 6}
    ]
    question_types.each do |question_type|
      q = QuestionType.new
      q.name = question_type[:name]
      q.code = question_type[:code]
      q.save
    end
    form_types = [
      {name: "Conditional", code: 1},
      {name: "Continuous", code: 2}
    ]
    form_types.each do |form_type|
      f = FormType.new
      f.name = form_type[:name]
      f.code = form_type[:code]
      f.save
    end
  end
end
