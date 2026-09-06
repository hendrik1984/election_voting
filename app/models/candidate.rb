class Candidate < ApplicationRecord
    belongs_to :election

    enum :status, {
        active: "active",
        inactive: "inactive"
    }

    validates :name, presence: true
    validates :candidate_number, numericality: { greater_than: 0 } 
end
