class MH4Weapons::Base
  def derived_from
    collection.find{ |weapon| weapon.name == @options["from"] }
  end

  def deriving_to
    collection.select{ |weapon| weapon.derived_from == self }
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
