#!/usr/bin/env ruby
# dirk (at) sebrink.de

module Solmisation
  Notes = %w{do re mi fa so la si}
  Defaults = {count: 3, join: '-'}

  def self.doit para = {}
    para = Defaults.merge(para)
    syllables = (0...para[:count]).to_a.map { Notes[rand(Notes.length)] }
    syllables.join(para[:join])
  end

end # ~solmisation

def usage
  puts "usage: #{$0} [ <syllable count> ]"
  exit
end

if __FILE__ == $0
  syllable_count = Integer(ARGV[0] && ARGV.shift.to_s || 3) rescue usage
  join = ARGV.shift || Solmisation::Defaults[:join]
  puts "#{Solmisation.doit join: join, count: syllable_count}"
end
