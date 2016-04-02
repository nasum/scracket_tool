require 'mysql2'
require './lib/file_manager.rb'
include FileManager

module DBConnector
  def self.connect(query, host, user, pass)
    client = create_client(host, user, pass)
    results = client.query(query)
    results.each do |row|
      puts "--------------------"
      row.each_value do |value|
        puts "#{value}"
        FileManager.save_image(value)
      end
    end
  end

  def self.show_tables(db_name, host, user, pass)
    client = create_client(host, user, pass)
    results = client.query("show tables from #{db_name}")

    results.each do |row|
      puts row.values
    end
  end

  private

  def self.create_client(host, user, pass)
    Mysql2::Client.new(host: host, user: user, password: pass)
  end
end
