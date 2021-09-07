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
    @game_id = data[:game_id].to_i
    @team_id = data[:team_id].to_i
    @hoa = data[:hoa]
    @result = data[:result]
    @settled_in = data[:settled_in]
    @head_coach = data[:head_coach]
    @goals = data[:goals].to_i
    @shots = data[:shots].to_i
    @tackles = data[:tackles].to_i
    @pim = data[:pim].to_i
    @power_play_opps = data[:powerplayopportunities].to_i
    @face_off_win_percentage = data[:faceoffwinpercentage].to_f
    @giveaways = data[:giveaways].to_i
    @takeaways = data[:takeaways].to_i
  end

  def self.all
    @all ||= load_game_team_data
  end

  def self.winner_of_game(game_id)
    find_game_team = all.find do |game_team|
      (game_team.game_id == game_id) && (game_team.result == "WIN")
    end
    return nil if find_game_team.nil?
    Team.find(find_game_team.team_id)
  end

  # def self.find_by_game_id(game_id)
  #   all.find do |game_team|
  #     (game_team.game_id == game_id) && (game_team.result == "WIN")
  #   end
  # end

  private

  def self.load_game_team_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      GameTeam.new(row)
    end
  end
end
