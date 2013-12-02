#!/usr/bin/env ruby

def fizzify(number)
  fizz = { 3  => 'fizz', 5  => 'buzz', 7  => 'dazz', 11 => 'kezz' }

  fizzes = fizz.map do |divisor, fizziness|
    fizziness if number % divisor == 0
  end.compact

  fizzes.empty? ? number : fizzes.join
end

(0..100).each do |i|
  puts fizzify(i)
end
