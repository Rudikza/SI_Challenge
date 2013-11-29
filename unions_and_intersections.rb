#!/usr/bin/env ruby

class Array
	def union( second_list )
		( self + second_list ).uniq
	end

	def intersection( list2 )
		new_arry = []

		self.each do |list1_item|
			list2.each do |list2_item|
				new_arry << list2_item if list1_item.eql? list2_item
			end
		end

		list2.each do |list2_item|
			self.each do |list1_item|
				new_arry << list1_item if list2_item.eql? list1_item
			end
		end

		new_arry.uniq
	end
end

list1 = %w(Milk Eggs Bread Coffee Bananas Apples Lettuce Tomatoes Toothpaste Deodorant)
list2 = %w(Coke Cigarettes Airtime Eggs Coffee Lettuce Cake Milk)

puts "Union of two lists"
puts list1.union( list2 )

puts "\n"

puts "Intersection of two lists"
puts list1.intersection( list2 )