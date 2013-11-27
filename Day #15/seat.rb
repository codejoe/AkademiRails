# Seat A - F
# Row 32
# Contoh input = 1A

class Seat

  def initialize seat_number
    @seat_number = seat_number.upcase
    @alphabet    = @seat_number[-1,1]
  end

  def position
    @alphabet
  end

  def row
    @seat_number.to_i
  end

  def window?
    @alphabet == 'A' || @alphabet == 'F'
  end

  def lorong?
    @alphabet == 'C' || @alphabet == 'D'
  end

  def middle_seat?
    !window? && !lorong?
  end

  # def front_row?
  #   if [1..10].include? @seat_number.to_i
  #     "Front Row"
  #   elsif [11..20].include? @seat_number.to_i
  #     "Middle Row"
  #   else
  #     "Rear Row"
  #   end      
  # end

end