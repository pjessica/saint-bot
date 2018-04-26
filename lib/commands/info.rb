module Commands
  # Command Module
  module Info
    extend Discordrb::Commands::CommandContainer
    command(
      :info
    ) do |event|
      "```css\nSainT Guild Personal Bot\n\nDefault prefix: !\nHelp: !help\n\nIf you have any ideas or suggestions please contact the admin.\n```"
    end
  end
end
