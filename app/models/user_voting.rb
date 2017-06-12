class UserVoting < ApplicationRecord
  belongs_to :election
  belongs_to :user
end
