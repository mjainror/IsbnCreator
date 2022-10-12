class IsbnCreator
  def initialize(isbn)
    @isbn = isbn.to_s.gsub(/\s/, '')
    check_valid_isbn!
  end

  def check_valid_isbn!
    raise StandardError.new "Invalid ISBN! - ISBN length should be 13" unless @isbn.length == 12
    raise StandardError.new "Invalid ISBN!" if @isbn.to_i.to_s != @isbn
  end

  def get_calculated_isbn
    @isbn + (10 - (get_sum_isbn_numbers % 10)).to_s
  end

  def get_sum_isbn_numbers
    sum = 0
    isbn_arr = @isbn.split('').map(&:to_i)

    isbn_arr.each_with_index do |num , idx|
      num *= 3 if idx.odd? && !num.zero?

      sum += num
    end
    
    sum
  end
end

# ctr = IsbnCreator.new(978014300723)
# puts (ctr.get_calculated_isbn)
