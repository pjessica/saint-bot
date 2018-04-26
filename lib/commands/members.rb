module Commands
  # Command Module
  module Members
    extend Discordrb::Commands::CommandContainer
    command(
      :members
    ) do |event, sort_class, sort_bp|
      datas = ""
      sortQuery = ""
      # if !sort_class.nil? || !sort_bp.nil?
      #   sorts = Array.new
      #   sortQuery = "ORDER BY "
      #   sorts.push("class " + sort_class) unless sort_class.nil?
      #   sorts.push("bp " + sort_bp) unless sort_bp.nil?
      #   sorts.each_with_index do |sort, i|
      #     sortQuery += sorts
      #     if i != sorts.length - 1
      #       sortQuery += ", "
      #     end
      #   end
      # end

      members = $db.query("SELECT * from members "+sortQuery)
      members.each do |row|
        server_user = BOT.member(event.server.id, row["sid"])
        datas += "#{server_user.name} / #{row["class"]} / #{row["BP"]} (last updated: #{row["updated_at"].strftime('%d/%m/%y | %H:%M:%S')})\n"
      end
      datas
    end
  end
end
