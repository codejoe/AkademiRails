# Bukan countdown
# def hello n
# 	if n == 0
# 		puts 0
# 	else
# 		puts hello n-1
# 	end
# 	puts "Angka #{n}"
# end

# puts hello 4

def hello n
	"Angka #{n}"
	if n == 0
		0
	else
		hello n-1
	end
end

puts hello 4