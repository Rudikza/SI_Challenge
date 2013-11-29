#!/usr/bin/env ruby

class Numeric
	def multiple_of?( number )
		 ( to_f.modulo number ).to_i == 0 ? true : false
	end
end

(1..100).each do |number|
	print number.to_i unless number.multiple_of?( 3 ) || number.multiple_of?( 5 )

  print "Fizz" if number.multiple_of?( 3 )
  print "Buzz" if number.multiple_of?( 5 )
    
	print "\n"
end
