class Vote < ApplicationRecord
  belongs_to :election
  belongs_to :candidate
end
