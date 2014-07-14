require "has_specs/version"
require "has_specs/configuration"
require 'has_specs/rails_defaults'
require 'has_specs/base'

module HasSpecs
  class MatchingSpecFileDoesNotExist < StandardError;   end 

  class << self
    def verify
      HasSpecs::Base.verify (self.configuration)
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def root=(root)
      self.configuration.root=root
    end

    def root
      self.configuration.root
    end

    def spec_root=(spec_root)
      self.configuration.spec_root=spec_root
    end

    def spec_root
      self.configuration.spec_root
    end

    def exclude=(exclude)
      self.configuration.exclude=exclude
    end

    def exclude
      self.configuration.exclude
    end

    def ignore=(ignore)
      self.configuration.ignore=ignore
    end

    def ignore
      self.configuration.ignore
    end

    def suffix=(suffix)
      self.configuration.suffix=suffix
    end

    def suffix
      self.configuration.suffix
    end

    def extension
      self.configuration.extension
    end

    def included
      self.configuration.included
    end
  end
end
