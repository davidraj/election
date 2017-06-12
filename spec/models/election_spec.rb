require 'rails_helper'

RSpec.describe Election, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it{ should have_many(:votes).dependent(:destroy)}
  it{ should have_many(:user_votings).dependent(:destroy)}
  it{ should validate_presence_of(:max_votes_per_user)}
end
