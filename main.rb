require 'date'
require 'dotenv'
require 'discordrb'
require 'discordrb/data'
require 'rubygems'
require 'rufus-scheduler'
require 'time'

def date_of_next(day)
  date  = Date.parse(day)
  delta = date > Date.today ? 0 : 7
  date + delta
end

def valid_guild_raid?
  Date.today == date_of_next("Tuesday") || Date.today == date_of_next("Thursday") || Date.today == date_of_next("Saturday")
end

def valid_time?(start_time, end_time)
  Time.now > Time.parse(start_time) && Time.now < Time.parse(end_time)
end

def set_role(role)

end

# Load the environment variables
Dotenv.load

# Load the bot constant
BOT = Discordrb::Commands::CommandBot.new token: ENV['TOKEN'], client_id: ENV['CLIENT_ID'], prefix: '!'
SCHEDULER = Rufus::Scheduler.new

BOT.mention do |event|
  event.respond 'Hello '+event.user.username+'!'
end

# COMMAND LIST
BOT.command :info do |event|
  "```css
  SainT Guild Personal Bot

  Default prefix: !
  Help: !help

  If you have any ideas or suggestions please contact the admin.
  ```"
end

BOT.command :help do |event|
  "__**Role Commands**__

  > `!roles` - view available roles.

  > `!setrole [role]` - add role to member

  > `!removerole [role]` - remove role from member

  __**Other Commands**__

  > `!info` - get bot info."
end

BOT.command :roles do |event|
  "```
  Academic
  Archer
  Assassin
  Cleric
  Sorceress
  Warrior```"
end

BOT.command :setrole do |event, *args|
  begin
    server_role = event.server.roles.find { |role| role.name.downcase == args[0].downcase }
    server_user = BOT.member(event.server.id, event.user.id)
    unless server_role.nil?
      server_user.add_role(server_role)
      message = event.user.username + " added to role " + server_role.name
    else
      message = "Make sure the role you choose is available. Check `!roles`"
    end
  rescue => error
    message = error
  end
  message
end

BOT.command :removerole do |event, *args|
  begin
    server_role = event.server.roles.find { |role| role.name.downcase == args[0].downcase }
    server_user = BOT.member(event.server.id, event.user.id)
    unless server_role.nil?
      server_user.remove_role(server_role)
      message = event.user.username + " removed from role " + server_role.name
    else
      message = "Make sure the role you choose is available. Check `!roles`"
    end
  rescue => error
    message = error
  end
  message
end

# REMINDER
if valid_guild_raid? && valid_time?("7.00 am", "7.30 pm")
  SCHEDULER.every '1h' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] Guild Boss @19.30 Harap stand by sebelumnya```')
  end
end

if valid_time?("1.00 pm", "9.30 pm")
  SCHEDULER.interval '1h', :first_in => '1s' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] Guild Red Envelope @20.00```')
  end
end

if valid_time?("00.00 am", "00.30 am")
  SCHEDULER.interval '5m' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] World Boss @12.30```')
  end
end

if valid_time?("9.00 am", "00.00 am")
  SCHEDULER.interval '30m' do
    BOT.send_message(ENV['CHANNEL_ID'].to_i, '```[REMINDER] World Boss @12.30```')
  end
end

BOT.command(:exit, help_available: false) do |event|
  # able to shut your bot down whenever they wanted.
  break unless event.user.id == 436516326446596096

  BOT.send_message(event.channel.id, 'Bot is shutting down')
  exit
end

puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][STARTUP] SainT-Bot Online!"
BOT.run
