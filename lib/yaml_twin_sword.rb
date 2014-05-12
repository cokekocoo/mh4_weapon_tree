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

    def derived_from
      @weapons[@options["from"]]
    end

    def ancestors
      if derived_from
        [self] + derived_from.ancestors
      else
        []
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
