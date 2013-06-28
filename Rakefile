# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SecondBookcase::Application.load_tasks

namespace :db do
  desc "Add books to the books table in the database"
  task :populate_books_table => :environment do
    require 'faker'

    # Create books's
    500.times do |x|
      book = Book.new()
      book.name = Faker::Name.name
      book.description = Faker::Lorem.paragraph(sentence_count = 3)
      book.rating = rand(0..5)
      book.times_rated = rand(0..100).to_i
      book.save!
    end
    puts "Added 5 books."
  end
end
