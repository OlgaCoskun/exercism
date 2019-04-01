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

  def get_win
    self.wins += 1
  end

  def get_loss
    self.loses += 1
  end

  def get_draw
    self.draws += 1
  end
end

class Match

  attr_reader :team1, :team2, :result

  def initialize(team1, team2, result)
    @team1 = team1
    @team2 = team2
    @result = result

    case result
    when 'win'
      team1.get_win
      team2.get_loss
    when 'loss'
      team1.get_loss
      team2.get_win
    when 'draw'
      team1.get_draw
      team2.get_draw
    end
  end
end

class Tournament

  HEADER = ['Team'.ljust(31) + '| MP |  W |  D |  L |  P' + "\n"].freeze

  attr_reader :matches

  def self.tally(input)
    @teams = []
    matches = []
    scores = []

    input.split("\n").map {|e| e.split(";")}.each do |match|
      team1 = get_team(match[0])
      team2 = get_team(match[1])
      matches << Match.new(team1, team2, match[2])
    end

    @teams.sort { |a,b| [b.points, a.name] <=> [a.points, b.name]}.each do |t|
      scores << "%-31s|%3d |%3d |%3d |%3d |%3d\n" % [t.name, t.matches, t.wins, t.draws, t.loses, t.points]
    end
    result = HEADER + scores
    result.join
  end

  def self.get_team(team_name)
    team = @teams.find { |e| e.name == team_name }
    return team unless team.nil?
    team = Team.new(team_name)
    @teams << team
    team
  end
end
