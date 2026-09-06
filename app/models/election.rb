class Election < ApplicationRecord
    has_many :candidates, dependent: :restrict_with_error
    
    enum :status, {
        active: "active",
        inactive: "inactive"
    }

    validates :title, presence: true
    validates :start_at, presence: true
    validates :end_at, presence: true

    def state
        return 'inactive' if inactive?
        return 'upcoming' if Time.current < start_at
        return 'ongoing' if Time.current <= end_at
        return 'ended'
    end
end
