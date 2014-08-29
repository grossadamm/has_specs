# HasSpecs

[![Build Status](https://travis-ci.org/grossadamm/has_specs.svg?branch=master)](https://travis-ci.org/grossadamm/has_specs)

Very basic gem that allows you to verify that every file in your project has a matching spec or test file.

It expects that the folder structure of the root directory and spec directory be identical, so it's fairly limited in the fact that it doesn't look at rails route or lib tests.

It was built with rspec in mind, but I don't see why it couldn't be repurposed for other test harnesses.

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

  HasSpecs.ignore << 'application_controller.rb'
  HasSpecs.verify
```

#### Configuration

```
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
