#!/usr/bin/env ruby

module TemperatureInputParser
  def parse
    @value = find_numbers

    @unit = "celsius" if is_celsius?
    @unit = "fahrenheit" if is_fahrenheit?

    throw_error( "unit" ) unless unit
    throw_error( "value" ) unless value
  end

  def is_celsius?
    input =~ /c/i
  end

  def is_fahrenheit?
    input =~ /f/i
  end

  def find_numbers
    input.scan(/\d/).join.to_i
  end

  def throw_error( input )
    puts "You have not specified a valid #{input} to be converted." 
    exit
  end
end

class TemperatureConverter
  include TemperatureInputParser
  
  attr_accessor :input, :unit, :value, :converted_value, :converted_unit

  def initialize( input)
    @input = input
  end

  def convert
    convert_celsius_to_fahrenheit if is_celsius?
    convert_fahrenheit_to_celsius if is_fahrenheit?
  end

  def convert_celsius_to_fahrenheit
    @converted_value = ( value * 1.8 + 32 ).round( 2 )
    @converted_unit = "Fahrenheit"
  end
    
  def convert_fahrenheit_to_celsius
    @converted_value = ( ( value - 32 ) / 1.8 ).round( 2 )
    @converted_unit = "Celsius"
  end
end

welcome_text = <<-eos
Welcome to the worlds best temperature converter.

To convert from Celsius to Fahrenheit simply type in the value followed by either the 
word Celsius(or just the letter c) or the word Fahrenheit(or the letter f) and we will
convert it for you e.g 10 c would return 50.0 degree Fahrenheit.

eos

puts "\e[H\e[2J"
puts welcome_text

input = gets.chomp

temperature_input = TemperatureConverter.new( input )
temperature_input.parse
temperature_input.convert

puts "\n"
print "#{temperature_input.value} degrees #{temperature_input.unit} is equal to "
print "#{temperature_input.converted_value} degrees #{temperature_input.converted_unit}."
print "\n"




