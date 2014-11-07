# Rubis

Look up language codes & names.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubis'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubis

## Usage

Searching is case-insensitive, but otherwise requires an exact match.

```
require "rubis"

[...]

# Search all fields
Rubis.search("english")
# or, just the language's English name
Rubis.search(english_name: "french")
# or, just the language's native name, in native script
Rubis.search(native_name: "العربية")
# or, just the language's native name, in ASCII
Rubis.search(transliterated_native_name: "francais")
# or, just the ISO 639-1 code
Rubis.search(iso_639_1: "el")

```

All calls, if successful, return a `Rubis::Language` instance from which you can ready any of the search fields (`english_name`, `iso_639_1`, etc.)

## Contributing

1. Fork it ( https://github.com/cpfair/rubis/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
