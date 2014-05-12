class TwinSword < ActiveRecord::Base
  validates :name,          presence: true, uniqueness: true, length: { in: 1..30 }
  validates :rarity,        presence: true, numericality: { greater_than: 0,             less_than: 8 }
  validates :power,         presence: true, numericality: { greater_than: 0,             less_than: 500 }
  validates :red_length,    presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :orange_length, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :yello_length,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :green_length,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :blue_length,   presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :white_length,  presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :strike_ratio,  presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 101 }
  validates :slots_count,   presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 4 }

  after_initialize do |sword|
    sword.name          ||= ""
    sword.rarity        ||= 1
    sword.power         ||= 0
    sword.red_length    ||= 0
    sword.orange_length ||= 0
    sword.yello_length  ||= 0
    sword.green_length  ||= 0
    sword.blue_length   ||= 0
    sword.white_length  ||= 0
    sword.strike_ratio  ||= 0
    sword.slots_count   ||= 0
  end
end
