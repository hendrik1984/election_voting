class Candidate < ApplicationRecord
    belongs_to :election
    has_many :votes, dependent: :restrict_with_error

    enum :status, {
        active: "active",
        inactive: "inactive"
    }

    validates :name, presence: true
    validates :candidate_number, numericality: { greater_than: 0 } 
end
