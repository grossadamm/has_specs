module HasSpecs
  class Configuration
    def root=(desired_root)
      @root = desired_root
    end

    def root
      @root ||= Dir.pwd
    end

    def spec_root=(desired_root)
      @spec_root = desired_root
    end

    def spec_root
      @spec_root ||= File.join(Dir.pwd,'spec')
    end

    def exclude=(exclude_dirs)
      @exclude = exclude_dirs
    end

    def exclude
      @exclude ||= ['spec']
    end

    def ignore=(ignore_files)
      @ignore = ignore_files
    end

    def ignore
      @ignore ||= []
    end

    def suffix=(suffix)
      @suffix = suffix
    end

    def suffix
      @suffix ||= '_spec'
    end

    def extension
      ".rb"
    end

    def include
      Dir.glob(File.join(self.root,'**/*/'))
        .map!{|d| d.gsub(@root, '').sub(File::SEPARATOR,'').chomp(File::SEPARATOR) }
        .delete_if do |directory|
          found = false
          self.exclude.each do |excluded|
            continue if found
            found = directory.start_with?(excluded)
          end
          found
        end
    end

    def use_rails_defaults
      self.exclude.concat(HasSpecs::RailsDefaults.exclude)
      self.root = HasSpecs::RailsDefaults.root
      self.suffix = HasSpecs::RailsDefaults.suffix
    end
  end
end