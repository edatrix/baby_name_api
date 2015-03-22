class Nameline < ActiveRecord::Base

  conn = ActiveRecord::Base.connection
  rc = connection.raw_connection

  columns = [:state_name,:sex, :year, :name, :count]

  start_time = Time.now

  rc.transaction do
    rc.exec("COPY namelines (#{columns.map(&:to_s).join(', ')}) FROM STDIN")

    Dir.glob("./db/seeds/source/*").each do |state|
      file = File.open('state', 'r')
      index = 0
    end

    while !file.eof?
      rc.put_copy_data(file.readline)
    end

    rc.put_copy_end

    while res = rc.get_result
      print e_message if e_message = res.error_message
    end
  end

  finish_time = Time.now

  puts "time to import: #{finish_time-start_time}"

end
