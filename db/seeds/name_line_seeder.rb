require "csv"

class NameLineSeeder

  def self.open_file(filename)
    CSV.open(filename, :headers => [], :header_converters => :symbol)
  end

  def self.parse_file(filename)
    open_file(filename)
  end

  def self.seed(number = nil, out = STDOUT)
    source_path = Rails.root.join('db', 'pages')

    Dir.glob("./db/seeds/source/*").each do |page|
      data = NameLineSeeder.parse_file(page)
      data.map { |line| build_name_lines(line, out) }
    end
  end

  def self.build_name_lines(line, out)
    state = NameLine.create!(:id => line[:id],
                          :state_name => line[:state_name],
                          :sex => line[:sex],
                          :year => line[:year],
                          :name => line[:name],
                          :count => line[:count])
    out.puts line[:state_name]
  end

end