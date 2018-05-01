module Commands
  # Command Module
  module Members
    extend Discordrb::Commands::CommandContainer
    command(
      :members
    ) do |event, sort_class, sort_bp|
      session = GoogleDrive::Session.from_service_account_key("Saint-eabc6edcec0e.json")
      ws = session.spreadsheet_by_key(ENV['GSHEET_KEY']).worksheets[0]

      datas = ""
      sortQuery = ""
      members = ""
      (1..ws.num_rows).each_with_index do |row, count|
        member = ""
        (1..ws.num_cols).each_with_index do |col, i|
          if [0, 2, 3, 4].include? i
            member += "|%2s| " % ws[row, col] if i == 0
            member += ws[row, col] + " / " if i == 2
            member += ws[row, col] if i == 3
            member += " |%7s|" % ws[row, col] if i == 4
          end
        end
        members += member+"\n"
        if count == 45
          datas += members
          members = ""
        end
      end
      event.channel.send_message(datas)
      event.channel.send_message(members)
    end
  end
end
