require 'byebug'
require 'pry-byebug'

class Team

  attr_reader :name
  attr_accessor :wins, :loses, :draws

  def initialize(name)
    @name = name
    @wins, @loses, @draws = 0, 0, 0
  end

  def points
    wins * 3 + draws
  end

  def matches
    wins + draws + loses
  end

  def win!
    self.wins += 1
  end

  def loss!
    self.loses += 1
  end

  def draw!
    self.draws += 1
  end
end

class Tournament

  HEADER = ['Team'.ljust(31) + '| MP |  W |  D |  L |  P' + "\n"].freeze

  def initialize(input)
    @teams = Hash.new { |h, k| h[k] = Team.new(k) }
    input.split("\n").map {|e| e.split(";")}.each do |team1_name, team2_name, match_result|
      team1 = get_team(team1_name)
      team2 = get_team(team2_name)
      Tournament.match(team1, team2, match_result)
    end
  end

  def self.match(team1, team2, result)
    @team1 = team1
    @team2 = team2
    @result = result

    case result
    when 'win'
      team1.win!
      team2.loss!
    when 'loss'
      team1.loss!
      team2.win!
    when 'draw'
      [team1, team2].map(&:draw!)
    end
  end

  def get_team(team_name)
    @teams[team_name]
  end

  def sorted_result
    sorted_teams.map { |t| "%-31s|%3d |%3d |%3d |%3d |%3d\n" % [t.name, t.matches, t.wins, t.draws, t.loses, t.points] }
  end

  def sorted_teams
    @teams.values.sort {|a, b| [b.points, a.name] <=> [a.points, b.name]}
  end

  def report
    (HEADER + sorted_result).join
  end

  def self.tally(input)
    new(input).report
  end

  protected
  attr_reader :matches, :scores
end
