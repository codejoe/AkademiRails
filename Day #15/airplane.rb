# Airplane has many seats
# Airbus A320 124 seats
# Boeing  737 100 seats
# Array of Object seats
# airplane.seats.first.window?


# Flight.new ({flight_number: 123, airplane: 'Boeing737', from: 'cgk', destination: 'sby', primary_row: 2})
class Flight

  attr_accessor :flight_number, :airplane, :from, :destination, 
  :broken_seat, :broken_row, :primary_row, :booked_seats

  def initialize(params = {}) 
    @flight_number = params[:flight_number] 
    @broken_row  = params[:broken_row] || 0
    @airplane = Airplane.new 'Boeing737', @broken_row
    @from = params[:from] 
    @destination = params[:destination] 
    @broken_seat = params[:broken_seat] || [] # ['1A', '3D']
    @primary_row  = params[:primary_row] || 0
    @booked_seats = []
  end

  def available_seats
    seats.reject { |e| e.row == @primary_row || 
      @broken_seat.include?(e.seat_number) || 
      @booked_seats.include?(e.seat_number) 
    }
  end

  def seats
    @airplane.seats
  end

  def primary_seats
    seats.select { |e| e.row == @primary_row }
  end

  def book seat_number 
    return 'Seat Already Booked!' if available_seats.select { |e| 
      e.seat_number == seat_number}.empty?
    @booked_seats << seat_number 

    # return objects
    # available_seats.select do |e|
    #   if e.seat_number.include? seat_number
    #     @booked_seats << seat_number
    #   end
    # end
    # @booked_seats    
  end

  def booked? seat_number
    @booked_seats.include?(seat_number) || 
    !primary_seats.select{ |e| e.seat_number == seat_number }.empty?
  end

  def booked_seats
    seats.select { |e| @booked_seats.include? e.seat_number }
  end

end

# Airplane.new 'Boeing737'
class Airplane

  # AIRPLANE = {'Boeing737' => {'row' => 32, 'column' => 6},
  #             'Airbus320' => {'row' => 64, 'column' => 6}
  #             }

  attr_accessor :type

  def initialize type, broken_row
    @type = type
    @broken_row = broken_row
  end

  def seats # array of object seats
    @array_of_seats = []

    if @type == 'Boeing737'
      rows = 3 - @broken_row
    elsif @type == 'Airbus320'
      rows = 6 - @broken_row
    else # unidentified airplane
      rows = 9 - @broken_row 
    end

    rows.times do |row|
      ('A'..'F').each do |position|
        seat = Seat.new "#{row+1}#{position}"
        @array_of_seats << seat      
      end
    end
    return @array_of_seats
  end

end

# Seat.new '11A'
class Seat

  attr_accessor :seat_number

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
end
