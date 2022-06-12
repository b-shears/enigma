
class Shifts
  attr_reader :random_number, :date
  def initialize(random_number, date)
    @random_number = random_number
    @date = date
  end

  def shift_keys
    keys = {A: @random_number[0..1].to_i,
      B: @random_number[1..2].to_i,
      C: @random_number[2..3].to_i,
      D: @random_number[3..4].to_i
    }
  end

  def shift_offsets
    sq_date = @date.to_i ** 2
    last_four = sq_date.to_s[-4..-1]
    offset = {A: last_four[0].to_i,
      B: last_four[1].to_i,
      C: last_four[2].to_i,
      D: last_four[3].to_i}
  end

  def shifts_sum
    shift_keys.merge!(shift_offsets) {|key, shift_key_value, offset_value| shift_key_value + offset_value}
  end

end
