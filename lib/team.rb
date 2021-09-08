# require 'csv'
require './lib/modules/finder'

class Team
  extend Finder
  @@filename = './data/teams.csv'
  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation,
              :stadium,
              :link,
              :all

  def initialize(data)
    @team_id = data[:team_id].to_i
    @franchise_id = data[:franchiseid]
    @team_name = data[:teamname]
    @abbreviation = data[:abbreviation]
    @stadium = data[:stadium]
    @link = data[:link]
  end

  alias_method :id, :team_id

  private

  def self.load_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      Team.new(row)
    end
  end
end
