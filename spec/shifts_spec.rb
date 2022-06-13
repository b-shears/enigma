require 'spec_helper'
require './lib/key_generator'
require './lib/shifts'

RSpec.describe Shifts do
  before :each do
    @message = "hello world"
    @date
    @shifts = Shifts.new("02715", "040895")
  end

  it 'exists' do
    expect(@shifts).to be_a(Shifts)
  end

  it 'can generate keys using a random 5 digit number' do
    expect(@shifts.shift_keys).to eq({A: 02, B: 27, C: 71, D: 15})
  end

  it 'can create offsets using the date of transmission' do
    expect(@shifts.shift_offsets).to eq({A: 1, B: 0, C: 2, D: 5})
  end

  it 'can assign shifts by adding the key & offsets together' do
      shift_result = {A: 3, B: 27, C: 73, D: 20}
    expect(@shifts.shifts_sum).to eq(shift_result)
  end
end
