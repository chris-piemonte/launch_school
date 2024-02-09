class Machine
  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end

  def switch_state
    puts "The current switch state is #{switch}."
  end

  private

  attr_accessor :switch

  def flip_switch(desired_state)
    self.switch = desired_state # need to make self.switch?
  end
end


machine = Machine.new
p machine.start
machine.switch_state
p machine.stop
machine.switch_state
