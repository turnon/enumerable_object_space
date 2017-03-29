# EnumerableObjectSpace

Make ObjectSpace enumerable

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'enumerable_object_space'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install enumerable_object_space

## Example

To know `:flash` are defined in what classes/modules in rails, in the old days, you may:

```ruby
ObjectSpace.each_object(Module){|o| puts o if o.instance_methods(false).include?(:flash)}
```

Now:

```ruby
ObjectSpace.find_all{|o| o.is_a?(Module) and o.instance_methods(false).include?(:flash)}
```

