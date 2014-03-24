class List < ActiveRecord::Base
    belongs_to :user
    has_many :list_items
    validates :name, presence: true, length: { minimum: 2, too_short: "must be at least 2 characters" }
    validates :user_id, presence: true
end
