module Commands
  # Command Module
  module Exit
    extend Discordrb::Commands::CommandContainer
    command(
      :exit
    ) do |event|
      # able to shut your bot down whenever they wanted.
      break unless event.user.id == 436516326446596096
      
      BOT.send_message(event.channel.id, '**Bot is shutting down**')
      exit
    end
  end
end
