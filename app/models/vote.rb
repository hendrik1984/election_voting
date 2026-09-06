class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :election
  belongs_to :candidate

  validates :user_id, uniqueness: {
    scope: :election_id,
    message: "has already voted in this election."
  }
end
