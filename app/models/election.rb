class Election < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :user_votings, dependent: :destroy  
  validates_presence_of :max_votes_per_user
end
