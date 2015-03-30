# Measuremerize

This gem will help you optimize your ruby code, given that you surround your
colprit block with

```
  Measuremerize.measure do
  ...
  end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'measuremerize'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install measuremerize

## Usage

For garbage collection measuring you can do this

```
  Measuremerize.measure do
  ...
  end
```

Otherwise you can disable garbage collection with the argument ``` true ```

```
  Measuremerize.measure(true) do
  ...
  end
```

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/iamkristian/measuremerize/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
