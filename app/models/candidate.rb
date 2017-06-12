class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :election
  validates_presence_of :party_name
  validates_presence_of :election_id
end
