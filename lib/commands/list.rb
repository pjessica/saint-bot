module Commands
  # Command Module
  module List
    extend Discordrb::Commands::CommandContainer
    command(
      :list
    ) do |event|
      datas = ""
      i=0
      File.open('files/list.txt', 'r') do |f|
        while data = f.gets
          i+=1
          datas += i.to_s + ". " + data
        end
      end
      if i != 0
        event.channel.send_message(datas)
      else
        event.channel.send_message("Empty")
      end
    end
  end
end
