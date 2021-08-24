require 'csv'
require 'pry'

class Name
  attr_reader :year, :bio_gender, :ethnicity, :name, :count, :rank
  @@filename = 'Popular_Baby_Names.csv'

  def initialize(data)
    @year = data[:year_of_birth]
    @bio_gender = data[:gender].downcase
    @ethnicity = data[:ethnicity].downcase
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

    all_names.find_all do |name|
      name.name == name_to_find
    end
  end

  def self.find_by_count(count)
    all_names.find_all do |name|
      name.count.to_i == count
    end
  end

  def self.find_by_rank(rank)
    all_names.find_all do |name|
      name.rank.to_i == rank
    end
  end

  def self.find_by_year(year)
    all_names.find_all do |name|
      name.year.to_i == year
    end
  end

  def self.where(query)
    find_by = query.keys.first
    criteria = query[find_by].downcase

    all_names.select do |name|
      name.send(find_by) == criteria
    end
  end
end
