module Commands
  # Command Module
  module UpdateBp
    extend Discordrb::Commands::CommandContainer
    command(
      :updatebp
    ) do |event, bp|
      "Update masing-masing di gdocs: https://docs.google.com/spreadsheets/d/1DNmMeGuYtnOupA9Wg1RL6JI_Qba_0sk6biKBdfJLxEs/edit#gid=0"
      # if bp.nil?
      #   message = "Make sure you use format `!updatebp [BP]`"
      # else
      #   begin
      #     data = $db.query("SELECT * from members where sid='"+event.user.id.to_s+"'")
      #     if data.first
      #       statement = $db.prepare("UPDATE members SET bp=?, updated_at=? where sid=?")
      #       result = statement.execute(bp, Time.now, event.user.id)

      #       message = 'Your BP updated to ' + bp + '!'
      #     else
      #       message = 'Sorry we can not find your data'
      #     end
      #   rescue => error
      #     message = error
      #   end
      # end
      # message
    end
  end
end
