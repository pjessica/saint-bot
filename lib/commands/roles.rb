module Commands
  # Command Module
  module Roles
    extend Discordrb::Commands::CommandContainer
    command(
      :roles
    ) do |event|
      "```css\nAcademic\nArcher\nAssassin\nCleric\nSorceress\nWarrior```"
    end
  end
end
