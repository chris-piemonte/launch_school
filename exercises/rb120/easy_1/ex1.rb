class Banner
  def initialize(message, banner_length = message.length + 4)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    "+#{'-' * (@message.length + 2)}+" 
  end

  def empty_line
    "|#{' ' * (@message.length + 2)}|"
  end

  def message_line
    lines = banner_length.split
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner


banner = Banner.new('')
puts banner
