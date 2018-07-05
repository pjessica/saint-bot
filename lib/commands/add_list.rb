module Commands
  # Command Module
  module AddList
    extend Discordrb::Commands::CommandContainer
    command(
      :addlist
    ) do |event, *text|
      text = text.join(' ')
      if text.nil?
        message = "Make sure you use format `!addlist [text]`"
      else
        File.open('files/list.txt', 'a') do |f|
          f.puts text + "\n"
        end
        event.channel.send_message("'#{text}' added to the list")
      end
    end
  end
end
