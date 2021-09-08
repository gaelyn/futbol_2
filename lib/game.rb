require 'csv'
require './lib/modules/finder'

class Game
  extend Finder
  @@filename = './data/games.csv'
  attr_reader :game_id,
              :season,
              :type,
              :date_time,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals,
              :venue,
              :venue_link

  def initialize(data)
    @game_id      = data[:game_id].to_i
    @season       = data[:season]
    @type         = data[:type]
    @date_time    = data[:date_time]
    @away_team_id = data[:away_team_id].to_i
    @home_team_id = data[:home_team_id].to_i
    @away_goals   = data[:away_goals].to_i
    @home_goals   = data[:home_goals].to_i
    @venue        = data[:venue]
    @venue_link   = data[:venue_link]
  end

  alias_method :id, :game_id

  # def self.all
  #   @all ||= load_games_data
  # end

  def away_team
    Team.find(away_team_id)
  end

  def home_team
    Team.find(home_team_id)
  end

  def winner
    GameTeam.winner_of_game(self.game_id)
  end

  private

  def self.load_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      Game.new(row)
    end
  end
end
