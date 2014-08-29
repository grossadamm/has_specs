module HasSpecs
  class Base
    def self.verify(config)
      missing = []
      config.include.each do |directory|
        lookat = File.join(config.root, directory,"*[("+config.extension.join(')(')+')]')
        Dir.glob(lookat).each do |file|
          spec_dir = File.dirname(file).gsub(config.root, config.spec_root)
          extension = File.extname(file)
          basename =  File.basename(file).chomp(extension)
          spec = config.to_spec_filename(file)
          spec_file = File.join(spec_dir,spec)
          unless config.ignore.include?(File.basename file) || File.exist?(spec_file)
            missing.push(spec_file)
          end
        end
      end
      return missing
    end
  end
end
