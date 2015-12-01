require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

class EulerScraper
  attr_reader :past_problems

  def initialize
    @url = "https://projecteuler.net/problem="
    @past_problems = []
  end

  # Gets a specific project Euler problem
  def get_problem number
    @url << number.to_s
    page = HTTParty.get(@url)
    parse_page = Nokogiri::HTML(page)
    problem = []
    parse_page.css("p").length.times do |n|
      problem << parse_page.css("p")[n].text
    end
    problem
  end

  # Gets a random projecr Euler problem
  def get_random_problem
    page = HTTParty.get(get_random_problem_url)
    parse_page = Nokogiri::HTML(page)
    problem = []
    parse_page.css("p").length.times do |n|
      problem << parse_page.css("p")[n].text
    end
    problem
  end

  private

  def get_random_problem_url
    randOBJ = Random.new
    rnproblem = randOBJ.rand(527) + 1
    unless @past_problems.include?(rnproblem)
      @past_problems << rnproblem
      @url << rnproblem.to_s
      @url
    else
      get_random_problem_url
    end
  end
end
