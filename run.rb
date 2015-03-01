module Color
  BLUE  = "\e[34m"
  RESET = "\e[0m"
end

def TITLE(title)
  puts "#{Color::BLUE}=====  #{title}  =====#{Color::RESET}"
end

def table(rows)
  format = rows.map { |row|
    row.map { |col| col.length }
  }.inject([0] * rows.first.length) { |max, current|
    max.zip(current).map { |pair| pair.max }
  }.map { |width|
    "%-#{width}s"
  }.join(" | ")

  rows.each do |row|
    puts (format % row).strip
  end
end

TITLE 'Environment variables'
table `env`.lines.map { |line| line.strip.split("=", 2) }

TITLE 'User'
puts `whoami`

TITLE 'Working directory'
puts `pwd`
