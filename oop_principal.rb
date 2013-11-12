#oop principal

class Kendaraan
	def berjalan(tempat)
	"sedang berjalan #{tempat}"
	end
end

class Motor < Kendaraan
	def berjalan(tempat,waktu)
	super(tempat) + " dengan roda dua pukul #{waktu}"
	end
end

puts Motor.new.berjalan("di taman",'3:30')