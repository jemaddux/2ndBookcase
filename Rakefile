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
    BookCategories.all.each do |book_category|
      book_category.delete
    end
    puts "Cleared book categories."
    Customer.all.each do |customer|
      customer.delete
    end
    puts "Cleared customer."
    ReadingList.all.each do |reading_list|
      reading_list.delete
    end
    puts "Cleared reading list."
    puts "Cleared the database."
  end

  desc "Populate database"
  task :populate_database => [:populate_categories, :populate_books,
          :populate_inventory, :populate_plans, :populate_customers,
          :populate_reading_lists]

  desc "Adds all the categories to the database"
  task :populate_categories => :environment do
    category_names = ["Arts & Photography", "Biographies & Memoirs", "Business & Investing", "Children's Books", "Christian Books & Bibles", "Comics & Graphic Novels", "Computers & Technology", "Cookbooks, Food & Wine", "Crafts, Hobbies & Home", "Education & Reference", "Gay & Lesbian", "Health, Fitness & Dieting", "History", "Humor & Entertainment", "Law", "Literature & Fiction", "Medical Books", "Mystery, Thriller & Suspense", "Parenting & Relationships", "Politics & Social Sciences", "Professional & Technical", "Religion & Spirituality", "Romance", "Science & Math", "Science Fiction & Fantasy", "Self-Help", "Sports & Outdoors", "Teen & Young Adult", "Travel"]
    category_names.each do |category_name|
      category = Category.new()
      category.name = category_name
      category.save!
    end
    puts "Created categories."
  end

  desc "Add books to the books table in the database"
  task :populate_books => :environment do
    require 'faker'

    puts "Adding books..."
    puts ""
    categories = Category.all
    # Create books's
    10_000.times do |x|
      book = Book.new()
      book.name = Faker::Name.name
      book.author = Faker::Name.name
      book.categories << categories.shuffle.first
      book.categories << categories.shuffle.last
      book.description = Faker::Lorem.paragraph(sentence_count = 30)
      book.rating = rand(0.0..5.0)
      book.times_rated = rand(0..100).to_i
      book.save!
      print "." if x % 100 == 0
    end
    puts ""
    puts "Added 10,000 books."
  end

  desc "Add inventory"
  task :populate_inventory => :environment do
    conditions = ["new", "good", "decent", "well loved", "retired"]

    puts "Adding inventory items..."
    puts ""
    50_000.times do |num|
      inventory = Inventory.new
      inventory.condition = conditions[rand(0..4)]
      inventory.checked_out = false
      inventory.save!

      book = Book.offset(rand(Book.count)).first
      book.inventories << inventory
      print "." if num % 100 == 0
    end
    puts ""
    puts "Added 50,000 inventory items."
  end

  desc "Add Plans"
  task :populate_plans => :environment do
    plan1 = Plan.new
    plan1.cost = 11.00
    plan1.description = "One book out at a time."
    plan1.save
    plan2 = Plan.new
    plan2.cost = 18.00
    plan2.description = "Two books out at a time."
    plan2.save
    plan3 = Plan.new
    plan3.cost = 25.00
    plan3.description = "Three books out at a time."
    plan3.save
    plan4 = Plan.new
    plan4.cost = 33.00
    plan4.description = "Four books out at a time."
    plan4.save
  end

  desc "Add Customers"
  task :populate_customers => :environment do
    require 'faker'

    puts "Adding customers..."
    puts ""
    1_000.times do |num|
      customer = Customer.new
      customer.password = "password"
      customer.password_confirmation = "password"
      customer.email = Faker::Internet.email
      customer.first_name = Faker::Name.first_name
      customer.last_name = Faker::Name.last_name
      customer.street_address = Faker::Address.street_address
      customer.city = Faker::Address.city
      customer.state = Faker::Address.state_abbr
      customer.zipcode = Faker::Address.zip_code
      customer.account_status = "payment current"
      customer.plan_id = rand(1..4)
      customer.save!

      subscription = Subscription.new
      subscription.customer_id = customer.id
      subscription.plan_id = customer.plan_id
      subscription.stripe_card_token = "xyz"
      subscription.stripe_customer_token = customer.id
      subscription.save!

      print "." if num % 100 == 0
    end
    puts ""
    puts "Added 1,000 customers."
  end

  desc "Add ReadingLists"
  task :populate_reading_lists => :environment do
    puts "Populating reading lists..."
    puts ""
    customers_count = Customer.count
    customers_count.times do |number|
      3.times do |num|
        book = Book.offset(rand(Book.count)).first
        if book.inventories.count > 0
          reading_list = ReadingList.new
          reading_list.customer_id = number + 1
          reading_list.book_id = book.id
          reading_list.inventory_id = book.inventories.first.id
          reading_list.loan_out_condition = book.inventories.first.condition
          reading_list.returned_condition = book.inventories.first.condition
          reading_list.loan_out_date = DateTime.now
          reading_list.returned_date = nil
          reading_list.out_on_loan = true
          reading_list.save!
        end
      end
      print "." if number % 100 == 0
    end
    puts ""
    puts "Added reading list for #{customers_count} customers."
  end
end











