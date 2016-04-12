# PracticalErrors

Make rails error messages more practical.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'practical_errors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install practical_errors

## Usage

Add `include PracticalErrors::Practicable` to your controller.

```ruby
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include PracticalErrors::Practicable
end
```

And then, error message will be like this:

```
ActiveRecord::RecordNotFound (
========== Practical Errors appends message from here ==========

Rails says, "Couldn't find Post with 'id'=1000".

You might have called ActiveRecord::FinderMethods#find, but the record for provided id was not found.
If you DO NOT want to raise ActiveRecord::RecordNotFound even if the record was not found,
you should use ActiveRecord::FinderMethods#find_by instead.

Post.find(1000) # raise ActiveRecord::RecordNotFound
Post.find_by(id: 1000) # just returns nill


========== Practical Errors appends message to here ==========
See more detail about Practical Errors: https://github.com/serihiro/practical_errors

):
```


### Supported error list
- `ActiveRecord::RecordNotFound`
- `ActiveRecord::RecordNotUnique`

Do you think that there is little error that support?
Please add !! (I will continue to increase supported errors, of course.)

## Dependency
- Rails '>= 4.0.0', '< 5.0'
- [error_arranger](https://github.com/serihiro/error_arranger) '0.1.0'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/practical_errors. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

