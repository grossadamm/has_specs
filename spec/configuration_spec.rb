require 'has_specs'

describe HasSpecs::Configuration do
  before(:each) do
    @config = HasSpecs::Configuration.new
  end

  it "defaults the root to the current dir" do
    expect(@config.root).to eq Dir.pwd
  end

  it "sets a new root" do
    @config.root = 'somedir'
    expect(@config.root).to eq 'somedir'
  end

  it "defaults the spec root to the current dirs specs dir " do
    expect(@config.spec_root).to eq File.join(Dir.pwd,'spec')
  end

  it "sets a new spec root" do
    @config.spec_root = 'somedir'
    expect(@config.spec_root).to eq 'somedir'
  end

  it "defaults to excluding the specs dir" do
    expect(@config.exclude).to eq ['spec']
    expect(@config.include).not_to include('spec')
  end

  it "sets new exclusion dirs" do
    @config.exclude = ['somedir']
    expect(@config.exclude).to eq ['somedir']
  end

  it "defaults to using _spec as the suffix" do
    expect(@config.suffix).to eq '_spec'
  end

  it "sets new suffix" do
    @config.suffix = '_somesuffix'
    expect(@config.suffix).to eq '_somesuffix'
  end

  it "has an extension of .rb" do
    expect(@config.extension).to eq '.rb'
  end

  it "lists included directories" do
    @config.root = Dir.pwd
    expect(@config.include).to include('lib')
  end

  it "can use the rails defaults" do
    fake_rails_class = Class.new do
      def self.root
        'fake_rails_root'
      end
    end
    stub_const("Rails",fake_rails_class)

    @config.use_rails_defaults
   
    expect(@config.exclude).to include File.join('assets')
    expect(@config.root).to include 'app'
    expect(@config.suffix).to eq '_spec'
  end    
end