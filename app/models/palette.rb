class Palette < ApplicationRecord
  belongs_to :user
  validates :user, :row, :col, :color, presence: true
end
