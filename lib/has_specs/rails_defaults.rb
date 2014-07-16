module HasSpecs
  class RailsDefaults
    def self.exclude
      (@exclude ||= []) << 'assets'
    end

    def self.root
      unless defined? Rails
        raise ArgumentError, "Rails not defined"
      end
      File.join(::Rails.root,'app')
    end

    def self.suffix
      "_spec"
    end

    def self.extension
      [".rb", ".erb", ".jbuilder"]
    end
  end
end