require 'csv'

class GameTeam
  @@filename = './data/game_teams.csv'
  attr_reader :game_id,
              :team_id,
              :hoa,
              :result,
              :settled_in,
              :head_coach,
              :goals,
              :shots,
              :tackles,
              :pim,
              :power_play_opps,
              :face_off_win_percentage,
              :giveaways,
              :takeaways
  def initialize(data)
    @game_id = data[:game_id],
    @team_id = data[:team_id],
    @hoa = data[:hoa],
    @result = data[:result],
    @settled_in = data[:settled_in],
    @head_coach = data[:head_coach],
    @goals = data[:goals],
    @shots = data[:shots],
    @tackles = data[:tackles],
    @pim = data[:pim],
    @power_play_opps = data[:powerplayopportunities],
    @face_off_win_percentage = data[:faceoffwinpercentage],
    @giveaways = data[:giveaways],
    @takeaways = data[:takeaways]
  end

  def self.all
    @all ||= load_game_team_data
  end

  private

  def self.load_game_team_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      GameTeam.new(row)
    end
  end
end
