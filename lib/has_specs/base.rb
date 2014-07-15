module HasSpecs
  class Base
    def self.verify(config)
      config.include.each do |directory|
        lookat = File.join(config.root, directory,"*"+config.extension)
        Dir.glob(lookat).each do |file|
          spec_dir = File.dirname(file).gsub(config.root, config.spec_root)
          basename =  File.basename file, config.extension
          spec_file = File.join(spec_dir,basename+config.suffix+config.extension)
          spec_output = File.join(basename+config.suffix+config.extension)
          unless config.ignore.include?(File.basename file) || File.exist?(spec_file)
            puts "* #{spec_output}"
          end
        end
      end
    end
  end
end
