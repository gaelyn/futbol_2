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

  def self.all_names
    @all_names ||= load_name_data
  end

  def self.load_name_data
    rows = CSV.read(@@filename, headers: true, header_converters: :symbol)

    rows.map do |row|
      Name.new(row)
    end
  end

  def self.find_by_name(name_to_find)
    name_to_find.downcase!

    all_names.find_all do |person|
      person.name == name_to_find
    end
  end

  def self.find_by_count(num)
    all_names.find_all do |person|
      person.count.to_i == num
    end
  end

  def self.find_by_rank(rank)
    all_names.find_all do |person|
      person.rank.to_i == rank
    end
  end

  def self.find_by_year(year)
    all_names.find_all do |person|
      person.year.to_i == year
    end
  end
end
