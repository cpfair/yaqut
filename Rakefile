require "bundler"
require "bundler/gem_tasks"
require "rexml/document"
require "yaqut/language"
require "yaml"
require "unidecoder"

Bundler.require

task :default => [:spec]
require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.rspec_opts = %w(-fd --color)
end

desc "Rebuild the language table - supply path to trunk of unicode CLDR as an argument"
task :rebuild do
  Bundler.require(:default, :development)

  cldr_trunk = ARGV.last
  data_files = Dir["#{cldr_trunk}/common/main/*.xml"].select { |path| !File.basename(path, ".xml").include?("_") }
  languages = {}
  data_files.each { |data_file|
    inspecting_language = File.basename(data_file, ".xml")
    doc = REXML::Document.new(File.read(data_file))
    doc.elements.each("ldml/localeDisplayNames/languages/language") do |lang|
      code_2 = lang.attribute("type").to_s
      if code_2.length == 2
        language = languages[code_2] ||= Yaqut::Language.new()
        language.iso_639_1 = code_2
        if inspecting_language == 'en'
          language.english_name = lang.text.downcase
        end
        if inspecting_language == code_2
          language.native_name = lang.text.downcase
          language.transliterated_native_name = language.native_name.to_ascii
        end
      end
    end
  }
  File.open('config/languages.yml', 'w') {|f| f.write languages.values.to_yaml }
end
