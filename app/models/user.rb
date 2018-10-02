class User < ActiveRecord::Base
  has_many :good_fits
  has_secure_password
  validates :username, uniqueness:  {case_sensitive: false}
  validates :email,presence: true
end
