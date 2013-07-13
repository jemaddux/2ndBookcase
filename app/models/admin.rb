class Admin < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  validates_uniqueness_of :email

  def self.create_admin(params)
    admin = Admin.new
    admin.password = params["admin"]["password"]
    admin.password_confirmation = params["admin"]["password_confirmation"]
    admin.email = params["admin"]["email"].downcase
    admin
  end

end
