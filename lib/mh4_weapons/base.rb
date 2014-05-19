class MH4Weapons::Base
  include MH4Weapons

  def self.yaml_basepath
    Rails.root + "lib/yaml/"
  end

  def self.filepath= path
    @@filepath = path
  end

  def self.all
    @all ||= YAML.load_file(self.yaml_basepath + @@filepath).map do |key, value|
      self.new key, value
    end
  end
end
