class YAMLTwinSword
  include Enumerable

  def each
    @@weapons.each{ |weapon|  yield weapon }
  end

  def [] key
    @@weapons.find { |weapon| weapon.name == key }
  end

  class TwinSword
    attr_reader :name

    def initialize name, value
      @name = name
      @options = value
      @weapons = ::YAMLTwinSword.new
    end

    def red_length
      @options["red_length"]
    end

    def sharpness_length color
      @options["#{color}_length"]
    end

    def sharpness_percentage color
      sharpness_length(color).to_f / 72.to_f * 100
    end

    def derived_from
      @weapons.find{ |weapon| weapon.name == @options["from"] }
    end

    def deriving_to
      @weapons.select{ |weapon| weapon.derived_from == self }
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

  @@weapons = YAML.load_file(Rails.root + "lib/yaml/twin_swords.yml").map do |key, value|
    TwinSword.new key, value
  end
end
