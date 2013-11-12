class Soal
	def initialize
		@soal = []
	end
	def set_soal(soal)
		@soal << soal
	end
	def get_soal
		@soal
	end
end
class Jawaban
	def initialize
		@jawaban = []
	end
	def set_jawaban(jawaban)
		@jawaban << jawaban
	end
	def get0_soal
		@jawaban
	end
end
class Flash_Game
	def load
	end
	def play
	end
	def check
	end
	def end
	end
end

class Card
	def initialize(soal,jawaban)
		@soal = soal
		@jawaban = jawaban
	end
	def get_soal
		@soal
	end
	def get_jawaban
		@jawaban
	end
end
