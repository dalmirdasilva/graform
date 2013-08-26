namespace :db do

  desc "Db from scratch"
  task fromscratch: :environment do
    puts "Dropping..."
    Rake::Task['db:drop'].invoke
    puts "Creating..."
    Rake::Task['db:create'].invoke
    puts "Migrating..."
    Rake::Task['db:migrate'].invoke
  end
end
