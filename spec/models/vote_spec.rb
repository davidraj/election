require 'rails_helper'

RSpec.describe Vote, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it{ should belong_to(:election)}
  it{ should belong_to(:candidate)}
end
