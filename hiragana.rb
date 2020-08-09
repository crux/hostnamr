#!/usr/bin/env ruby
# dirk (at) sebrink.de

module Hiragana

  Hiragana = %w{
    a   i   u   e   o
    ka  ki  ku  ke  ko  
    sa  shi su  se  so
    ta  chi tsu te  to
    na  ni  nu  ne  no
    ha  hi  hu  he  ho
    ma  mi  mu  me  mo  
    ya      yu      yo
    ra  ri  ru  re  ro
    wa              o
    n
  }

  Defaults = {count: 3, join: '-'}

  def self.doit para = {}
    para = Defaults.merge(para)
    #puts "syllables count: #{para.count}"
    (0...para[:count]).to_a.map {Hiragana[rand(Hiragana.length)]}.join(para[:join].strip)
  end

end # ~hostnamr

def usage
  puts "usage: #{$0} [ <syllable count> ]"
  exit
end

if __FILE__ == $0
  syllable_count = Integer(ARGV[0] && ARGV.shift.to_s || 3) rescue usage
  join = ARGV.shift || Hiragana::Defaults[:join]
  puts "#{Hiragana.doit join: join, count: syllable_count}"
end
