def log(command, user)
  $logs['commands'] = {} unless $logs.key?('commands')
  $logs['commands'][command] = 0 unless $logs['commands'].key?(
    command
  )
  $logs['commands'][command] += 1
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][COMMAND] #{command} : #{user}"
end

def check_class(user_class)
  ['warrior', 'archer', 'sorceress', 'cleric', 'academic', 'assassin', 'swordsman', 'mercenary', 'sharpshooter', 'acrobat', 'mystic', 'elementalist', 'paladin', 'priest', 'engineer', 'alchemist', 'shinobi', 'taoist', 'gladiator', 'barbarian', 'warden', 'tempest', 'war-mage', 'pyromancer', 'crusader', 'inquisitor', 'gear-master', 'adept', 'raven', 'abyss-walker', 'lunar-knight', 'destroyer', 'sniper', 'windwalker', 'chaos-mage', 'ice witch', 'guardian', 'saint', 'shooting-star', 'physician', 'reaper', 'bringer', 'bow-master'].include? user_class.downcase
end

def all_class
  ['warrior', 'archer', 'sorceress', 'cleric', 'academic', 'kali', 'swordsman', 'mercenary', 'sharpshooter', 'acrobat', 'mystic', 'elementalist', 'paladin', 'priest', 'engineer', 'alchemist', 'screamer', 'dancer', 'gladiator', 'barbarian', 'warden', 'tempest', 'war-mage', 'pyromancer', 'crusader', 'inquisitor', 'gear-master', 'adept', 'dark summoner', 'blade dancer', 'lunar-knight', 'destroyer', 'sniper', 'windwalker', 'chaos-mage', 'ice witch', 'guardian', 'saint', 'shooting-star', 'physician', 'soul-eater', 'spirit-dancer']
end

def load_json(file_location)
  if File.exist?(file_location)
    begin
      ar = {}
      ar = JSON.parse File.read file_location
    rescue
      ar = {}
    end
  else
    ar = {}
    puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] No file " \
         "#{file_location} to load!"
  end
  puts "[#{Time.now.strftime('%d %a %y | %H:%M:%S')}][LOADER] " \
       "#{file_location} loaded!"
  ar
end

def valid_guild_raid?
  Date.today == Date.parse("Tuesday") || Date.today == Date.parse("Thursday") || Date.today == Date.parse("Saturday")
end

def valid_time?(start_time, end_time)
  Time.now > Time.parse(start_time) && Time.now < Time.parse(end_time)
end
