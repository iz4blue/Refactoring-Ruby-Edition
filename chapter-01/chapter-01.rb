class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_reader :price_code

  def price_code=(value)
    @price_code = value
  end

  def initialize(title, the_price_code)
    @title, self.price_code = title, the_price_code
  end

  def charge(days_rented)
    result = 0

    case price_code
      when REGULAR
        result += 2
        result += (days_rented - 2) * 1.5 if days_rented > 2
      when NEW_RELEASE
        result += days_rented * 3
      when CHILDRENS
        result += 1.5
        result += (days_rented - 3) * 1.5 if days_rented > 3
    end
  end

  def frequent_renter_points(days_rented)
    (price_code == NEW_RELEASE && days_rented > 1) ? 2 : 1
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    movie.charge(days_rented)
  end

  def frequent_renter_points
    movie.frequent_renter_points(days_rented)
  end
end

class Customer
  attr_reader :name

  def initialize(name)
    @name = name
    @rentals = []
  end

  def add_rental(arg)
    @rentals << arg
  end

  def statement
    result = "고객 #{@name}의 대여 기록\n"
    @rentals.each do |element|
      # 이번 대여의 계산 결과를 표시
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
    end

    # 푸터 행 추가
    result += "대여료는 #{total_charge}입니다.\n"
    result += "적립 포인트는 #{total_frequent_renter_points}입니다."
    result
  end

  def html_statement
    result ="<h1>고객 <em>#{@name}</em>의 대여 기록</h1><p>\n"
    @rentals.each do |element|
      # 이번 대여의 계산 결과를 표시
      result += "\t" + element.movie.title + ": " + element.charge.to_s + "<br>\n"
    end

    # 푸터 행 추가
    result += "<p>대여료는 <em>#{total_charge}</em>입니다.<p>\n"
    result += "적립 포인트는 " +
        "<em>#{total_frequent_renter_points}</em> " +
        "입니다.<p>"
    result
  end

  private

  def total_charge
    @rentals.inject(0) { |sum, rental| sum + rental.charge }
  end

  def total_frequent_renter_points
    @rentals.inject(0) { |sum, rental| sum + rental.frequent_renter_points }
  end
end
