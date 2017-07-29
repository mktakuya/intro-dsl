lambda {
  setups = []
  profiles = {}

  Kernel.send :define_method, :setup do |&block|
    setups << block
  end

  Kernel.send :define_method, :profile do |entry, &block|
    profiles[entry] = block
  end

  Kernel.send :define_method, :each_setup do |&block|
    setups.each do |setup|
      block.call setup
    end
  end

  Kernel.send :define_method, :each_profile do |&block|
    profiles.each do |profile|
      block.call profile
    end
  end

}.call

load './tests/bmi_profile.rb'

each_profile do |entry, profile|
  env = Object.new
  each_setup do |setup|
    env.instance_eval &setup
  end
  puts entry if env.instance_eval &profile
end
