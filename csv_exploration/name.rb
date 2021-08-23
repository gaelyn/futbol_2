require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender]
    @ethnicity = data[:ethnicity]
    @name = data[:childs_first_name].downcase
    @count = data[:count]
    @rank = data[:rank]
  end

  def self.all
    # all_names into here
  end

  def self.find_by_name(name_to_find)
    name_to_find.downcase!
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)
    all_names = []

    rows.each do |row|
      all_names << Name.new(row)
    end

    all_names.find_all do |person|
      person.name == name_to_find
    end
  end
end
