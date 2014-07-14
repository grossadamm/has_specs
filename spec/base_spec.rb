require 'has_specs'

describe HasSpecs do
  it "throws no exceptions if all files have a matching spec" do
    HasSpecs.root = File.join(Dir.pwd,'lib','has_specs')
    HasSpecs.ignore << "version.rb"
    HasSpecs.verify
  end

  it "throws an exception if any files are missing a matching spec" do
    HasSpecs.root = Dir.pwd
    expect{HasSpecs.verify}.to raise_error
  end
end