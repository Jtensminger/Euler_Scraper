require './EulerScraper'

def main
  problem = EulerScraper.new
  puts problem.get_random_problem
end

puts main
