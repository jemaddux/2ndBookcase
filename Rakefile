# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

SecondBookcase::Application.load_tasks

namespace :db do
  desc "Delete everything in the database"
  task :clear_database => :environment do
    Book.all.each do |book|
      book.delete
    end
    puts "Cleared books."
    Category.all.each do |category|
      category.delete
    end
    puts "Cleared categories."
    Inventory.all.each do |inventory|
      inventory.delete
    end
    puts "Cleared inventory."
    puts "Cleared the database."
  end

  desc "Populate database"
  task :populate_database => [:populate_categories, :populate_books_table,
                              :populate_inventory]

  desc "Adds all the categories to the database"
  task :populate_categories => :environment do
    category_names = ["Arts & Photography", "Biographies & Memoirs", "Business & Investing", "Calendars", "Children's Books", "Christian Books & Bibles", "Comics & Graphic Novels", "Computers & Technology", "Cookbooks, Food & Wine", "Crafts, Hobbies & Home", "Education & Reference", "Gay & Lesbian", "Health, Fitness & Dieting", "History", "Humor & Entertainment", "Law", "Literature & Fiction", "Medical Books", "Mystery, Thriller & Suspense", "Parenting & Relationships", "Politics & Social Sciences", "Professional & Technical", "Religion & Spirituality", "Romance", "Science & Math", "Science Fiction & Fantasy", "Self-Help", "Sports & Outdoors", "Teen & Young Adult", "Travel"]
    category_names.each do |category_name|
      category = Category.new()
      category.name = category_name
      category.save!
    end
    puts "Created categories."
  end

  desc "Add books to the books table in the database"
  task :populate_books_table => :environment do
    require 'faker'

    categories = Category.all

    # Create books's
    10_000.times do |x|
      book = Book.new()
      book.name = Faker::Name.name
      book.author = Faker::Name.name
      book.categories << categories.shuffle.first
      book.categories << categories.shuffle.last
      book.description = Faker::Lorem.paragraph(sentence_count = 3)
      book.rating = rand(0.0..5.0)
      book.times_rated = rand(0..100).to_i
      book.save!
      print "." if x % 100 == 0
    end
    puts "Added 10,000 books."
  end

  desc "Add inventory"
  task :populate_inventory => :environment do
    conditions = ["new", "good", "decent", "well loved", "retired"]

    50_000.times do |num|
      inventory = Inventory.new
      inventory.condition = conditions[rand(0..4)]
      inventory.checked_out = false
      inventory.save!

      book = Book.offset(rand(Book.count)).first
      book.inventories << inventory
      print "." if num % 100 == 0
    end
    puts "Added 50,000 inventory items."
  end
end
