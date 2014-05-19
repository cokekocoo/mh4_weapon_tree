class MH4Weapons::TwinSword < MH4Weapons::Weapon
  self.filepath = "twin_swords.yml"

  attr_reader :name

  def initialize name, value
    @name = name
    @options = value
  end

  def power
    @options["power"]
  end

  def slots_count
    @options["slots_count"]
  end

  def sharpness_length color
    @options["#{color}_length"]
  end

  def sharpness_percentage color
    sharpness_length(color).to_f / 72.to_f * 100
  end
end
