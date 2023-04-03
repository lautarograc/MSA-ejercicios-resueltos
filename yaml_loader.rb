require "yaml"

class YamlLoader
  def self.load(file_path)
    YAML.load_file(file_path)
  end
end
