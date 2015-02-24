class State < ActiveRecord::Base
  require 'csv'

  # attr_reader :name_line

  #   def open_file(filename)
  #     CSV.open(filename, :headers => [], :header_converters => :symbol)
  #   end

  #   def parse_file(filename)
  #     data = open_file(filename)
  #     @name_line = data.map { |line| build_name_line(line)  }
  #   end

  #   def build_name_line(line)
  #     SSABabyNameExporter::NameLine.new(:id => line[:id],
  #                                        :state => line[:state],
  #                                        :sex => line[:sex],
  #                                        :year => line[:year],
  #                                        :name => line[:name],
  #                                        :count => line[:count])
  #   end

  def self.import(file)
    CSV.foreach(file.path, :headers => [], :header_converters => :symbol) do |row|
      State.create! row.to_hash
      # state_hash = row.to_hash
      # state = State.where(:id => product_hash[:id])
      # state.create!(state_hash)
    end
  end

end
