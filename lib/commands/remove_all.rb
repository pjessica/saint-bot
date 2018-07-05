module Commands
  # Command Module
  module RemoveList
    extend Discordrb::Commands::CommandContainer
    command(
      :removeall
    ) do |event|
      admin = event.server.roles.find { |role| role.name.downcase == 'admin' }
      # server_user = BOT.member(event.server.id, event.user.id)
      # puts event.user.highest_role
      if event.user.role?(admin) || event.user.owner?
        File.open('files/list.txt', 'w') do |f|
        end
        event.channel.send_message("#{event.user.name} removed everything")
      else
        event.channel.send_message("You don't have permission")
      end
    end
  end
end
