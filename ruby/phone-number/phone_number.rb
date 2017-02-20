class PhoneNumber
  attr_reader :number, :area_code

  def initialize(phone_number)
    @number = phone_number.gsub(/[()-\.\s]/, '')
    @number = ( @number =~ /^1?(\d{3})(\d{3})(\d{4})$/ ? $1 + $2 + $3 : '0000000000' )
    @area_code = @number[0..2]
  end

  def to_s
    "(%s) %s-%s" % [@number[0..2], @number[3..5], @number[6..11]]
  end
end
