module Commands
  # Command Module
  module AddMember
    extend Discordrb::Commands::CommandContainer
    command(
      :addmember
    ) do |event, user_class, bp|
      if user_class.nil? || bp.nil?
        message = "Make sure you use format `!addmember [class] [bp]`"
      else
        begin
          data = $db.query("SELECT * from members where sid='"+event.user.id.to_s+"'")
          unless data.first
            if check_class(user_class)
              statement = $db.prepare("INSERT INTO members(sid, class, BP, created_at, updated_at) VALUES(?, ?, ?, ?, ?)")
              result = statement.execute(event.user.id, user_class.downcase, bp, Time.now, Time.now)

              message = 'Member added to database!'
            else
              message = 'Class not found'
            end
          else
            message = 'Member already added'
          end
        rescue => error
          message = error
        end
      end
      message
    end
  end
end
