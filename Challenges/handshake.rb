class SecretHandshake
  COMMANDS = { 1000 => 'jump' ,
               100  => 'close your eyes',
               10   => 'double blink',
               1    => 'wink' }

  def initialize(binary_num)
    @binary = convert(binary_num)
  end

  def commands
    @commands = []
    no_reverse = reverse?
    COMMANDS.each do |number, commands|
      first, @binary = @binary.divmod(number)
      @commands << commands * first
    end

    @commands.delete('')
    return @commands if no_reverse
    @commands.reverse
  end

  private

  def reverse?
    first, @binary = @binary.divmod(10000)
    !first.zero?
  end

  def convert(number)
    case number
    when number.to_i.to_s then number.to_i
    when number.to_s.to_i then number.to_s(2).to_i
    else 0
    end
  end
end
