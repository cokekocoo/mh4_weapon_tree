class MH4Weapons::TwinSword
  attr_reader :name

  def initialize name, value
    @name = name
    @options = value
  end

  def sharpness_length color
    @options["#{color}_length"]
  end

  def sharpness_percentage color
    sharpness_length(color).to_f / 72.to_f * 100
  end

  def derived_from
    MH4Weapons.twin_swords.find{ |weapon| weapon.name == @options["from"] }
  end

  def deriving_to
    MH4Weapons.twin_swords.select{ |weapon| weapon.derived_from == self }
  end

  def ancestors
    if derived_from
      [self] + derived_from.ancestors
    else
      [self]
    end
  end

  def descendants
    if deriving_to.any?
      [self] + deriving_to.map(&:descendants).flatten
    else
      [self]
    end
  end

  def to_hash
    {
      name: name,
      from: derived_from
    }
  end
end
