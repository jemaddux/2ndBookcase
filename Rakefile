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

  desc "Add John's info"
  task :add_john => :environment do
    unless Customer.find_by_email("jemaddux@gmail.com")
      customer = Customer.new
      customer.password = "4Ginntonic"
      customer.password_confirmation = "4Ginntonic"
      customer.email = "jemaddux@gmail.com"
      customer.first_name = "John"
      customer.last_name = "Maddux"
      customer.street_address = "630 Pinetree Dr"
      customer.city = "Decatur"
      customer.state = "GA"
      customer.zipcode = "30030"
      customer.account_status = "payment current"
      customer.plan_id = 4
      customer.save!

      subscription = Subscription.new
      subscription.customer_id = customer.id
      subscription.plan_id = customer.plan_id
      subscription.stripe_card_token = "xyz"
      subscription.stripe_customer_token = customer.id
      subscription.save!

      admin = Admin.new
      admin.email = "jemaddux@gmail.com"
      admin.password = "4Ginntonic"
      admin.password_confirmation = "4Ginntonic"
      admin.save!
    end
  end

  desc "Adds all the categories to the database"
  task :populate_categories => :environment do
    category_names = ["Politics", "Science Fiction & Fantasy", "Travel"]
    category_names.each do |category_name|
      unless Category.find_by_name(category_name)
        category = Category.new()
        category.name = category_name
        category.save!
      end
    end
    puts "Created categories."
  end

  desc "Add Plans"
  task :populate_plans => :environment do
    if Plan.all.count == 0
      plan1 = Plan.new
      plan1.cost = 11.00
      plan1.description = "One book out at a time."
      plan1.save
      plan2 = Plan.new
      plan2.cost = 16.00
      plan2.description = "Two books out at a time."
      plan2.save
      plan3 = Plan.new
      plan3.cost = 21.00
      plan3.description = "Three books out at a time."
      plan3.save
      plan4 = Plan.new
      plan4.cost = 26.00
      plan4.description = "Four books out at a time."
      plan4.save
    end
  end

  desc "Add books to the books table in the database"
  task :populate_books => :environment do
    puts "Adding books..."
    puts ""
    book_count = Book.count

    books = [ { name: "Game of Thrones",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "The first book in George Martin's epic Song of Ice and Fire. The Starks and the Lannisters struggle for power in Westeros while across the near sea a new threat rises.",
                picture_url: "game_of_thrones"},
              { name: "Storm of Swords",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "storm_of_swords"},
              { name: "Feast for Crows",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "feast_for_crows"},
              { name: "Clash of Kings",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "clash_of_kings"},
              { name: "Dance with Dragons",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "dance_with_dragons"},
              { name: "Tuf Voyaging",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "tuf_voyaging"},
              { name: "Dreamsongs: Volume 1",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "dreamsongs_vol_1"},
              { name: "Fevre Dream",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "fevre_dream"},
              { name: "Dying of the Light",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "dying_of_the_light"},
              { name: "Windhaven",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "windhaven"},
              { name: "Hunter's Run",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "hunters_run"},
              { name: "Dreamsongs: Volume 2",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "dreamsongs_vol_2"},
              { name: "Catching Fire",
                author: "Suzanne Collins",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "catching_fire"},
              { name: "Enders Game",
                author: "Orson Scott Card",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "enders_game"},
              { name: "Foundation and Empire",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "foundation_and_empire"},
              { name: "Foundation",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "foundation"},
              { name: "Harry Potter and the Chamber of Secrets",
                author: "J.K. Rowling",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "harry_potter_and_the_chamber_of_secrets"},
              { name: "Harry Potter and the Deathly Hallows",
                author: "J.K. Rowling",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "harry_potter_and_the_deathly_hallows"},
              { name: "Harry Potter and the Goblet of Fire",
                author: "J.K. Rowling",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "harry_potter_and_the_goblet_of_fire"},
              { name: "Harry Potter and the Order of the Phoenix",
                author: "J.K. Rowling",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "harry_potter_and_the_order_of_the_phoenix"},
              { name: "Harry Potter and the Sorcerer's Stone",
                author: "J.K. Rowling",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "harry_potter_and_the_sorcerers_stone"},
              { name: "The Hobbit",
                author: "J.R.R. Tolkien",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_hobbit"},
              { name: "I, Robot",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "i_robot"},
              { name: "Mariel of Redwall",
                author: "Brian Jacques",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "mariel_of_redwall"},
              { name: "Mockingjay",
                author: "Suzanne Collins",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "mockingjay"},
              { name: "Nemesis",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "nemesis"},
              { name: "Prelude to Foundation",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "prelude_to_foundation"},
              { name: "Redwall",
                author: "Brian Jacques",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "redwall"},
              { name: "Second Foundation",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "second_foundation"},
              { name: "Shadowrise",
                author: "Tad Williams",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "shadowrise"},
              { name: "Speaker for the Dead",
                author: "Orson Scott Card",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "speaker_for_the_dead"},
              { name: "The Caves of Steel",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_caves_of_steel"},
              { name: "The Chronicles of Narnia",
                author: "C.S. Lewis",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_chronicles_of_narnia"},
              { name: "The Currents of Space",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_currents_of_space"},
              { name: "The End of Eternity",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_end_of_eternity"},
              { name: "The Fellowship of the Ring",
                author: "J.R.R. Tolkien",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_fellowship_of_the_ring"},
              { name: "The Gods Themselves",
                author: "Isaac Asimov",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_gods_themselves"},
              { name: "The Hedge Knight",
                author: "George R.R. Martin",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_hedge_knight"},
              { name: "The Hunger Games",
                author: "Suzanne Collins",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_hunger_games"},
              { name: "The Lord of the Rings",
                author: "J.R.R. Tolkien",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_lord_of_the_rings"},
              { name: "The Magicians Nephew",
                author: "C.S. Lewis",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_magicians_nephew"},
              { name: "The Name of the Wind",
                author: "Patrick Rothfuss",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_name_of_the_wind"},
              { name: "The Silver Chair",
                author: "C.S. Lewis",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_silver_chair"},
              { name: "The Voyage of the Dawn Treader",
                author: "C.S. Lewis",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "the_voyage_of_the_dawn_treader"},
              { name: "Xenocide",
                author: "Orson Scott Card",
                category_name: "Science Fiction & Fantasy",
                description: "derp",
                picture_url: "xenocide"}
            ]

    # Create books's
    books.each do |book|
      unless Book.find_by_name(book[:name])
        livre = Book.new()
        livre.name = book[:name]
        livre.author = book[:author]
        if Category.find_by_name(book[:category_name])
          livre.categories << Category.find_by_name(book[:category_name])
        end
        livre.description = book[:description]
        livre.picture_url = book[:picture_url]
        livre.save!
      end
    end
    puts ""
    puts "Added #{Book.count - book_count} books."
  end

  desc "Populate Database with real Data"
  task :populate_database => [:populate_categories, :populate_books,
                              :populate_plans, :add_john]


##############  Fake Data Below  ###################
  desc "Fill database with fake data"
  task :fake_out_database => [:fake_populate_categories, :fake_populate_books,
          :fake_populate_inventory, :populate_plans, :add_john,
          :fake_populate_customers, :fake_populate_reading_lists]

  desc "Adds all the categories to the database"
  task :fake_populate_categories => :environment do
    category_names = ["Arts & Photography", "Biographies & Memoirs", "Business & Investing", "Children's Books", "Christian Books & Bibles", "Comics & Graphic Novels", "Computers & Technology", "Cookbooks, Food & Wine", "Crafts, Hobbies & Home", "Education & Reference", "Gay & Lesbian", "Health, Fitness & Dieting", "History", "Humor & Entertainment", "Law", "Literature & Fiction", "Medical Books", "Mystery, Thriller & Suspense", "Parenting & Relationships", "Politics & Social Sciences", "Professional & Technical", "Religion & Spirituality", "Romance", "Science & Math", "Science Fiction & Fantasy", "Self-Help", "Sports & Outdoors", "Teen & Young Adult", "Travel"]
    if Category.all.count == 0
      category_names.each do |category_name|
        category = Category.new()
        category.name = category_name
        category.save!
      end
      puts "Created categories."
    else
      puts "Categories already created."
    end
  end

  desc "Add books to the books table in the database"
  task :fake_populate_books => :environment do
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
  task :fake_populate_inventory => :environment do
    conditions = ["new", "good", "decent", "well loved", "retired"]

    puts "Adding inventory items..."
    puts ""
    50_000.times do |num|
      inventory = Inventory.new
      inventory.condition = conditions[rand(0..4)]
      inventory.checked_out = false
      if inventory.condition == "retired"
        inventory.in_circulation = false
      else
        inventory.in_circulation = true
      end
      inventory.save!

      book = Book.offset(rand(Book.count)).first
      book.inventories << inventory
      print "." if num % 100 == 0
    end
    puts ""
    puts "Added 50,000 inventory items."
  end

  desc "Add Customers"
  task :fake_populate_customers => :environment do
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
  task :fake_populate_reading_lists => :environment do
    puts "Populating reading lists..."
    puts ""
    customers_count = Customer.count
    customers_count.times do |number|
      4.times do |num|
        book = Book.offset(rand(Book.count)).first
        if book.inventories.count > 0
          reading_list = ReadingList.new
          reading_list.customer_id = number + 1
          reading_list.book_id = book.id
          reading_list.inventory_id = nil
          reading_list.loan_out_condition = nil
          reading_list.returned_condition = nil
          reading_list.loan_out_date = nil
          reading_list.returned_date = nil
          reading_list.out_on_loan = false
          reading_list.in_list = true
          reading_list.save!
        end
      end
      print "." if number % 100 == 0
    end
    puts ""
    puts "Added reading list for #{customers_count} customers."
  end
end











