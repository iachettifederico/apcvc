require "csv"
require 'open-uri'

namespace :data do
  namespace :create do
    desc "Create All the books"
    task :books => :environment do
      puts "Creating books"
      file = Pathname("lib/tasks/data/books.csv").expand_path
      CSV.foreach(file, headers: true) do |row|
        Book.create! row.to_hash
      end
    end

    desc "Create All the Events"
    task :events => :environment do
      puts "Creating Events"
      file = Pathname("lib/tasks/data/events.csv").expand_path
      CSV.foreach(file, headers: true) do |row|
        r = row.to_hash
        file_name = "#{r["id"]}/#{r["poster"]}"
        file_url  = "http://s3-sa-east-1.amazonaws.com/apcvc-posters/uploads/event/poster/#{file_name}"

        if r["poster"]
          file = Tempfile.new(['image', '.jpg'])
          file.binmode
          file << open(file_url).read

          e = Event.new
          e.title        = r["title"]
          e.date         = r["date"]
          e.content      = r["content"]
          e.front_page   = true
          e.announcement = true
          e.poster = file
          e.save!
          file.close
          puts "New Event: #{e.title}"
        else
          e = Event.new
          e.title        = r["title"]
          e.date         = r["date"]
          e.content      = r["content"]
          e.front_page   = true
          e.announcement = true
          e.save!
          puts "New Event: #{e.title}"
        end
      end

    end
  end
end
