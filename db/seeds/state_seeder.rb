require "csv"

class StateSeeder

  def self.open_file(filename)
    CSV.open(filename, :headers => [], :header_converters => :symbol)
  end

  def self.parse_file(filename)
    open_file(filename)
  end

  def self.seed(number = nil, out = STDOUT)
    source_path = Rails.root.join('db', 'pages')

    Dir.glob("./db/seeds/source/*").each do |page|
      data = StateSeeder.parse_file(page)
      data.map { |line| build_states(line, out) }
    end
  end

  def self.build_states(line, out)
    state = State.create!(:id => line[:id],
                          :state => line[:state],
                          :sex => line[:sex],
                          :year => line[:year],
                          :name => line[:name],
                          :count => line[:count])
    out.puts line[:state]
  end

end