module HasSpecs
  class Configuration
    def root=(desired_root)
      @root = desired_root
    end

    def root
      if defined? Rails
        @root ||= File.join(::Rails.root,'app')
      else
       @root ||= Dir.pwd
     end
    end

    def spec_root=(desired_root)
      @spec_root = desired_root
    end

    def spec_root
      @spec_root ||= File.join(Dir.pwd,'spec')
    end

    def exclude
      @exclude ||= ['spec', 'assets']
    end

    def exclude=(exclude_dirs)
      @exclude = exclude_dirs
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
      [".rb", ".erb", ".jbuilder"]
    end

    def include
      Dir.glob(File.join(self.root,'**/*/'))
        .map!{|d| d.gsub(@root, '').sub(File::SEPARATOR,'').chomp(File::SEPARATOR) }
        .delete_if do |directory|
          found = false
          self.exclude.each do |excluded|
            next if found
            found = directory.start_with?(excluded)
          end
          found
        end
    end

    def to_spec_filename(filename)
      if File.extname(filename) != '.rb' 
        filename = File.basename(filename) + suffix + ".rb"
      else
        extension = File.extname(filename)
        basename = File.basename(filename, extension)
        filename = basename + suffix + extension
      end
    end
  end
end