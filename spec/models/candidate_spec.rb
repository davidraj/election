require 'rails_helper'

RSpec.describe Candidate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it{ should validate_presence_of(:party_name)}
  it{ should validate_presence_of(:election_id)}
  it{ should belong_to(:user)}
  it{ should belong_to(:election)}
end
