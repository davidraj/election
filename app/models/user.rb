class User < ApplicationRecord
  
   # encrypt password
  has_secure_password
  
  has_many :candidates, dependent: :destroy
  has_many :user_votings, dependent: :destroy
  
  validates_presence_of :email
  validates_presence_of :password_digest
  validates_presence_of :electoral_id
  validates_uniqueness_of :email
  validates_uniqueness_of :electoral_id
end
