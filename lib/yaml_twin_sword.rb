class YAMLTwinSword
  @@yaml = YAML.load_file(Rails.root + "lib/yaml/twin_swords.yml")

  class << self
    def [] key
      @@yaml[key]
    end
  end
end
