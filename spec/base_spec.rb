require 'has_specs'

describe HasSpecs do
  it "returns an empty array if all files have a matching spec" do
    config = HasSpecs::Configuration.new
    config.root = File.join(Dir.pwd,'lib','has_specs')
    config.ignore << "version.rb"
    expect(HasSpecs::Base.verify(config)).to eq []
  end

  it "prints messages if any files are missing a matching spec" do
    config = HasSpecs::Configuration.new
    config.root = Dir.pwd
    expect(HasSpecs::Base.verify(config)).to include 'base_spec.rb'
  end
end