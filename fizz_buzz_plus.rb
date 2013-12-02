#!/usr/bin/env ruby
require 'pry'

class Numeric
  def multiple_of?( number )
     ( to_f.modulo number ).to_i == 0 ? true : false
  end
end

class FizzBuzz
  attr_reader :value
  WORDS = {fizz: 3, buzz: 5, dazz: 7, kezz: 11}

  def initialize( number )
    @number = number
    @value = ""
  end

  def check_for_fizzability
    WORDS.each_pair do |word, multiple|
      set_fizz( "#{word}", multiple)
    end

    set_number
  end

  def set_fizz(word, number)
    @value.concat "#{word}".capitalize if @number.multiple_of?( number )
  end

  def set_number
    @value = @number if @value.empty?
  end
end


(1..100).each do |number|
  fb = FizzBuzz.new( number )
  fb.check_for_fizzability

  print fb.value
  print "\n"
end

print "\n"

fb = FizzBuzz.new( 3*5*7*11 )
fb.check_for_fizzability

puts fb.value
