module Commands
  # Command Module
  module Classes
    extend Discordrb::Commands::CommandContainer
    command(
      :classes
    ) do |event|
      classes = ""
      all_class.each_with_index do |v, i|
        classes += v
        if i != all_class.length - 1
          classes += ", "
        end
      end
      classes
    end
  end
end
