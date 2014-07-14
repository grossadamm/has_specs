# HasSpecs

Very basic gem that allows you to verify that every file in your project has a matching spec file.

## Installation

Add this line to your application's Gemfile:

    gem 'has_specs'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install has_specs

## Usage

```
  # spec_helper.rb (or rails_helper.rb)

  require 'has_specs'

  # ... in the config block

  HasSpecs.configuration.use_rails_defaults
  HasSpecs.ignore << 'application_controller.rb'
  HasSpecs.verify
```

#### Configuration

```
configuration.use_rails_defaults # sets up to use app/ as the root amoungst other things
configuration.ignore << 'some_file_to_ignore.rb'
configuration.exclude << 'some/whole/dir/to/exclude.rb'
configuration.include << 'some/whole/dir/to/optionally/include'
configuration.suffix << '_spec'
configuration.root = 'some/other/root/for/source/files'
configuration.spec_root = 'some/other/root/for/tests'
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/has_specs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
