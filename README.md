# Interactor::AddFailed

Interactor::AddFailed adds observability to [Interactor](https://github.com/collectiveidea/interactor) gem by showing which interactors have failed when organizing several of them together

See [Interactor](https://github.com/collectiveidea/interactor) to check out how the base gem works.


If you find Interactor approach interesting, have a look at [Actor](https://github.com/sunny/actor). 

It does everything that Interactor does but slightly different and better.
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interactor-add_failed'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install interactor-add_failed

## Usage

Add this line to your Interactor::Organizer class 
```ruby 
include Interactor::AddFailed
```

This would add two extra keys into Interactor::Context (that's what any Interactor returns after it is finished)
- `successfull_interactors` - Interactors that run successfully
- `failed_interactor` - Interactor that has failed through `context.fail!`
> failed_interactor key will not show up if no interactor has failed


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Please let me know if there are any bugs with this gem

If you have any notes about code organisation or smells 👃 tell me!  

Bug reports and pull requests are welcome on GitHub at https://github.com/ArturGin/interactor-add_failed.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).