# GemVersionWrapper

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/gem_version_wrapper`. To experiment with that code, run `bin/console` for an interactive prompt.

With this gem you get GemVersionWrapper.build method that you can replace Gem::Version.new.
Difference between the two is that GemVersionWrapper is more robust and it will not fail if you pass it to invalid input.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gem_version_wrapper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gem_version_wrapper

## Usage

```ruby
GemVersionWrapper.build('1.0') # => <Gem::Version '1.0'>
GemVersionWrapper.build('1.')  # => <Gem::Version '1.0'>

Gem::Version.new('1.0')        # => <Gem::Version '1.0'>
Gem::Version.new('1.')         # => Exception
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tonidezman/GemVersionWrapper.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
