require 'erb'

kids_data   = File.read('data/kids-data.txt')
naughty_letter = File.read('templates/naughty_letter_template.txt.erb')

kids_data.each_line do |kid|

  kid_data_array = kid.split

  name     = kid_data_array[0]
  behavior = kid_data_array[1]
  toys     = kid_data_array[2..7]
  last_toy = kid_data_array[7]
  infraction = kid_data_array[14..-1]
  if toys.include?('Kaleidoscope')
    toys.delete('Kaleidoscope')
  end
  first_toy = toys.sample
  most_toys = toys - [first_toy]


  next unless behavior == 'naughty'

  filename    = 'letters/naughty/' + name + '.txt'
  letter_text = ERB.new(naughty_letter, nil, '-').result(binding)


  puts "Writing #{filename}."
  File.write(filename, letter_text)

end

puts 'Done!'
