# PassAttempt

PassAttempt run a block depending on a condition.

Super simple Singleton with counter by name, that process a block. when condition is true.

I wrote this gem in order to avoid fill my exception_notification service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pass_attempt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pass_attempt

## Usage

```ruby
name = 'my_filtred_acction'
condition = ->(attempts) { attempts.odd? }

(1..4).each do |i|
  PassAttempt.try(name, condition) do
    puts "my_filtred_acction #{i}"
  end
end

my_filtred_acction 1
my_filtred_acction 3
```

Condition can be a proc that receive counter for name and return boolean.
Also condition can be a symbol (:log2 or :log10), to be used as test of counter of name.

## Contributing

1. Fork it ( https://github.com/alejandrobabio/pass_attempt/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
