class ListItem < ActiveRecord::Base
  belongs_to :list
  validates :to_do, presence: true



end