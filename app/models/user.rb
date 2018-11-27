class User < ApplicationRecord
  has_many :palettes, dependent: :destroy
  validates :username, :ip_address, presence: true

  def self.get_record_along_with_fav_color
    joins(:palettes).order("palettes_count desc").select("users.*, (select color from palettes where palettes.user_id = users.id  
      group by color having count(color)=(select max(t.color_count) from (select count(color) 
      color_count from palettes  where palettes.user_id = users.id group by color)t) limit 1) as fav_color").uniq
  end  
end
