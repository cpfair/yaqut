require "yaqut/version"
require "yaqut/language"
require "yaml"

module Yaqut
  ALL_FIELDS = [:english_name, :native_name, :transliterated_native_name, :iso_639_1]

  def self.search(any_field=nil, **search_params)
    raise "Specify at least one search parameter" if any_field.nil? && (search_params.none? || search_params.all? { |param| param.nil? })
    raise "Cannot specify specific fields and a general search term" if any_field && search_params.any?
    # Case changes can be expensive, only do them once
    any_field = any_field.downcase if any_field
    search_params.each{ |key, str| search_params[key] = str.downcase }
    # Not particularly efficient, but there are only ~200
    database.find { |language|
      (!any_field.nil? && ALL_FIELDS.any? { |field| language.send(field) == any_field }) ||
      (search_params.any? && search_params.all? { |field, param| language.send(field) == param })
    }
  end

  def self.database
    @database ||= YAML::load_file("config/languages.yml")
  end
end
