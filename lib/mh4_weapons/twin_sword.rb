class MH4Weapons::TwinSword < MH4Weapons::Weapon
  self.filepath = "twin_swords.yml"

  attr_reader :name, :attrs

  def initialize name, value
    @name = name
    @options = value
    @attrs = value["attrs"].nil? ? [] : Attr.parse(value["attrs"])
  end

  def power
    @options["power"]
  end

  def strike_ratio
    @options["strike_ratio"]
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
