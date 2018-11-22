class User < ApplicationRecord
  has_many :palettes, dependent: :destroy
  validates :username, :ip_address, presence: true
end
