class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :username
  validates_presence_of   :username
  validates               :username, length: { in: 1..20 }

  validates_confirmation_of :password
end
