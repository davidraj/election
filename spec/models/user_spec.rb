require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  it{ should have_many(:candidates).dependent(:destroy)}
  it{ should have_many(:user_votings).dependent(:destroy)}
  it{ should validate_presence_of(:email)}
  it{ should validate_presence_of(:password_digest)}
  it{ should validate_presence_of(:electoral_id)}
  it{ should validate_uniqueness_of(:electoral_id)}
  it{ should validate_uniqueness_of(:email)}
end
