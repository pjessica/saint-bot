module Commands
  # Command Module
  module RemoveList
    extend Discordrb::Commands::CommandContainer
    command(
      :removelist
    ) do |event, index|
      datas = []
      index = index.to_i
      if index.nil? || index == 0
        message = "Make sure you use format `!removelist [number]`"
      else
        File.open('files/list.txt', 'r') do |f|
          while data = f.gets
            datas << data
          end
        end
        text = datas[index-1]
        datas.delete_at(index-1)
        File.open('files/list.txt', 'w') do |f|
          datas.each do |data|
            f.puts data
          end
        end

        event.channel.send_message("'#{text[0..text.length-2]}' removed to the list")
      end
    end
  end
end
