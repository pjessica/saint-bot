require 'date'
require 'dotenv'
require 'discordrb'
require 'discordrb/data'
require 'google_drive'
require 'rubygems'
require 'rufus-scheduler'
require 'time'

Dir['lib/commands/*.rb'].each { |file| require_relative file }
Dir['lib/concerns/*.rb'].each { |file| require_relative file }

# Load environment variables
Dotenv.load

# Load bot
BOT = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: ENV['CLIENT_ID'], prefix: '!'

# # Load Database
# $db = Mysql2::Client.new( :host => ENV["MYSQL_HOST"], :username => ENV["MYSQL_USER"], :password => ENV["MYSQL_PASSWORD"], :port => ENV["MYSQL_PORT"], :database => ENV["MYSQL_DATABASE"], :reconnect => true)

# Load scheduler
SCHEDULER = Rufus::Scheduler.new

BOT.mention do |event|
  event.respond 'Hello '+event.user.name+'!'
end

# Load all command modules
Commands.constants.each do |x|
  BOT.include! Commands.const_get x
end

# REMINDER
if valid_guild_raid? && valid_time?("7:00 am", "7:30 pm")
  SCHEDULER.every '1h', :first_in => '1s' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] Guild Boss @19.30 Harap stand by sebelumnya```')
  end
end

if valid_time?("1:00 pm", "9:30 pm")
  SCHEDULER.every '1h', :first_in => '1s' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] Guild Red Envelope @20.00```')
  end
end

if valid_time?("00:00 pm", "00:30 pm")
  SCHEDULER.every '5m', :first_in => '1s' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] World Boss @12.30 @everyone```')
  end
end

if valid_time?("9:00 am", "11:00 am")
  SCHEDULER.every '30m', :first_in => '1s' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] World Boss @12.30```')
  end
end

puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] SainT-Bot Online!"
BOT.run
