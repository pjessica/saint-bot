module Commands
  # Command Module
  module Help
    extend Discordrb::Commands::CommandContainer
    command(
      :help
    ) do |event|
      help = ""
      help += "__**Role Commands**__\n\n"
      help += "> `!roles` - view available roles.\n"
      help += "> `!setrole [role]` - add role to member\n"
      help += "> `!removerole [role]` - remove role from member\n\n"
      help += "__**Member Commands**__\n\n"
      help += "> `!members` - view all members\n\n"
      help += "__**List Commands**__\n\n"
      help += "> `!list` - view list\n"
      help += "> `!addlist [text]` - add text to list\n"
      help += "> `!removelist [number]` - remove selected list\n"
      help += "> `!removeall` - remove all list\n\n"
      # help += "> `!classes` - view class list\n"
      # help += "> `!addmember [class] [BP]` - register in game data. (If your class contains space, please change it into character `-` Ex: war-mage)\n"
      # help += "> `!updateclass [class]` - update your class\n"
      # help += "> `!updatebp [bp]` - update your bp\n\n"
      help += "__**Other Commands**__\n\n"
      help += "> `!info` - get bot info.\n"
      help
    end
  end
end
