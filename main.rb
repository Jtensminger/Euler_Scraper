require './EulerScraper'

def main
  problem = EulerScraper.new
  problem.get_random_problem
end

puts main
