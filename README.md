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
