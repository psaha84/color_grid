class Palette < ApplicationRecord
  belongs_to :user
  validates :user, :row, :col, :color, presence: true
  scope :latest, -> { where("id in (select max(id) from palettes group by row, col)") }

  def as_json(options = {})
    {
      row: row,
      column: col,
      color: color,
      info: "#{user.username}, #{created_at.strftime('%d/%m/%Y')}"
    }
  end
end
