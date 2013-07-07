# DocStrings

DocStrings allows you to define and access Python-like docstrings in Ruby.

[![Build Status](https://travis-ci.org/chendo/docstrings.png)](https://travis-ci.org/chendo/docstrings)

## Installation

Add this line to your application's Gemfile:

    gem 'docstrings'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install docstrings

## Usage

```ruby
class Dog
  def bark
    """Tell the dog to bark."""
    puts "Woof!"
  end

  def sit
    """
      Makes the dog sit.
    """
    @state = :sitting
  end
end

Dog.instance_method(:bark).docstring # => "Tell the dog to bark."
Dog.new.method(:sit).docstring       # => "Makes the dog sit.
```

## How does it work?

Ruby has this odd syntax which allows you to concatenate two strings by simply having them side by side:

```ruby
"foo" "bar" # => "foobar"
```

So `"""Foo"""` simply evaluates to `"Foo"`, and all this gem does is define a method to retrieve this value by using `Method#source_location`.

## Wouldn't this cause a performance hit every time the method is called?

Nope! At least, not in CRuby. Ruby is smart enough to recognise when string literals aren't actually used, and will skip generating bytecode for it. Thanks to @charliesome for pointing this out.

```ruby
def no_docstring
  nil
end

def with_docstring
  """Foo"""
  nil
end

puts RubyVM::InstructionSequence.of(method(:no_docstring)).disasm
puts "---"
puts RubyVM::InstructionSequence.of(method(:with_docstring)).disasm

# Output:
# == disasm: <RubyVM::InstructionSequence:no_docstring@/tmp/execpad-ecb5745fbd46/source-ecb5745fbd46>
# 0000 trace            8                                               (   1)
# 0002 putnil
# 0003 trace            16                                              (   3)
# 0005 leave
# ---
# == disasm: <RubyVM::InstructionSequence:with_docstring@/tmp/execpad-ecb5745fbd46/source-ecb5745fbd46>
# 0000 trace            8                                               (   5)
# 0002 putnil
# 0003 trace            16                                              (   8)
# 0005 leave
```

See https://eval.in/36676

## Compatibility

* Ruby 1.9.x, 2.x
* JRuby 1.9 mode
* Rubinus 1.9 mode

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

See `LICENSE.txt`. It's MIT.
