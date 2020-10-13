require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("cheese hat", "queso guy", "food-wear")
s2 = Startup.new("cheese sock", "queso guy", "food-wear")
s3 = Startup.new("dog wings", "flappy", "pet-transport")
v1 = VentureCapitalist.new("money Baggs", 1_000_000_000)
v2 = VentureCapitalist.new("monita", 1_000_000)
f1 = FundingRound.new(s1, v1, "seed", 10_000)
f2 = FundingRound.new(s1, v2, "seed", 1000)
f3 = FundingRound.new(s1, v1, "type A", 10_000)
f4 = FundingRound.new(s2, v2, "seed", 10_000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line