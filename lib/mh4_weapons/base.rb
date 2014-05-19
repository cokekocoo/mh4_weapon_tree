class MH4Weapons::Base
  def self.yaml_basepath
    Rails.root + "lib/yaml/"
  end

  def self.filepath
    @@filepath
  end

  def self.filepath= path
    @@filepath = path
  end

  def self.map_yaml filename
    YAML.load_file(self.yaml_basepath + filename).map do |key, value|
      yield key, value
    end
  end

  def self.all
    @@all ||= self.map_yaml self.filepath do |key, value|
      self.new key, value
    end
  end
end
