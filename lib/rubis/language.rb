require 'unidecoder'

module Rubis
  class Language
    attr_accessor :english_name, :native_name, :iso_639_1

    def transliterated_native_name
      @transliterated_native_name ||= native_name.to_ascii unless native_name.nil?
    end
  end
end