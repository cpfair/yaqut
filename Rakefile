require "bundler/gem_tasks"
require "rexml/document"
require "rubis/language"
require "yaml"

desc "Rebuild the language table - supply path to trunk of unicode CLDR"
task :rebuild do
  cldr_trunk = ARGV.last
  data_files = Dir["#{cldr_trunk}/common/main/*.xml"].select { |path| !File.basename(path, ".xml").include?("_") }
  languages = {}
  data_files.each { |data_file|
    inspecting_language = File.basename(data_file, ".xml")
    doc = REXML::Document.new(File.read(data_file))
    doc.elements.each("ldml/localeDisplayNames/languages/language") do |lang|
      code_2 = lang.attribute("type").to_s
      if code_2.length == 2
        language = languages[code_2] ||= Rubis::Language.new()
        language.iso_639_1 = code_2
        if inspecting_language == 'en'
          language.english_name = lang.text.to_s
        end
        if inspecting_language == code_2
          language.native_name = lang.text.to_s
        end
      end
    end
  }
  File.open('config/languages.yml', 'w') {|f| f.write languages.values.to_yaml }
end


