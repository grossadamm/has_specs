require 'has_specs'

describe HasSpecs::RailsDefaults do
  it "defaults to excluding the assets dir" do
    expect(HasSpecs::RailsDefaults.exclude).to include 'assets'
  end

  it "defaults to using _spec as the suffix" do
    expect(HasSpecs::RailsDefaults.suffix).to eq '_spec'
  end
end