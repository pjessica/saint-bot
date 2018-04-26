module Commands
  # Command Module
  module RemoveRole
    extend Discordrb::Commands::CommandContainer
    command(
      :removerole
    ) do |event, user_role|
      if user_role.nil?
        message = "Make sure you use format `!removerole [class]`"
      else
        begin
          server_role = event.server.roles.find { |role| role.name.downcase == user_role.downcase }
          server_user = BOT.member(event.server.id, event.user.id)
          unless server_role.nil?
            server_user.remove_role(server_role)
            message = event.user.name + " removed from role " + server_role.name
          else
            message = "Make sure the role you choose is available. Check `!roles`"
          end
        rescue => error
          message = error
        end
      end
      message
    end
  end
end
