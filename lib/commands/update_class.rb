module Commands
  # Command Module
  module UpdateClass
    extend Discordrb::Commands::CommandContainer
    command(
      :updateclass
    ) do |event, user_class|
      if user_class.nil?
        message = "Make sure you use format `!updateclass [class]`"
      else
        begin
          data = $db.query("SELECT * from members where sid='"+event.user.id.to_s+"'")
          if data.first
            if check_class(user_class)
              statement = $db.prepare("UPDATE members SET class=?, updated_at=? where sid=?")
              result = statement.execute(user_class.downcase, Time.now, event.user.id)

              message = 'Your class updated to ' + user_class + '!'
            else
              message = 'Class not found'
            end
          else
            message = 'Sorry we can not find your data'
          end
        rescue => error
          message = error
        end
      end
      message
    end
  end
end
