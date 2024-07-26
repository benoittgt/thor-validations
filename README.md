# Thor::Validations

Thor::Validations adds a `validate_before` method to Thor, allowing you to perform validations before executing commands.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thor-validations'
```

## Inspiration

Thanks to https://github.com/kddnewton/thor-hollaback for the original idea.


## Usage

```ruby
require 'thor/validations'

class MyCommand < Thor
  include Thor::Validations

  validate_before, :deploy, :rollback do
    check_permissions
  end

  desc "deploy", "Deploy app"
  def deploy
    sleep(1)
    puts "Deploying..."
  end

  desc "rollback", "Rollback app"
  def rollback
    sleep(1)
    puts "Rolling back..."
  end

  private

    def check_permissions
      puts "Checking permissions..."
    end

end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/benoittgt/thor-validations.

## Test

```bash
ruby -Ilib:test test/**/*_test.rb
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
