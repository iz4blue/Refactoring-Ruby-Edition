class Movie
  REGULAR = 0
  NEW_RELEASE = 1
  CHILDRENS = 2

  attr_reader :title
  attr_accessor :price_code

  def initialize(title, price_code)
    @title, @price_code = title, price_code
  end
end

class Rental
  attr_reader :movie, :days_rented

  def initialize(movie, days_rented)
    @movie, @days_rented = movie, days_rented
  end

  def charge
    result = 0

    case movie.price_code
      when Movie::REGULAR
        result += 2
        result += (days_rented - 2) * 1.5 if days_rented > 2
      when Movie::NEW_RELEASE
        result += days_rented * 3
      when Movie::CHILDRENS
        result += 1.5
        result += (days_rented - 3) * 1.5 if days_rented > 3
    end

    result
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
    total_amount, frequent_renter_points = 0, 0
    result = "고객 #{@name}의 대여 기록\n"
    @rentals.each do |element|

      # 적립 포인트를 더함
      frequent_renter_points += 1
      # 최신물을 이틀 이상 대여하면 보너스 포인트를 더함
      if element.movie.price_code == Movie::NEW_RELEASE && element.days_rented > 1
        frequent_renter_points += 1
      end

      # 이번 대여의 계산 결과를 표시
      result += "\t" + element.movie.title + "\t" + element.charge.to_s + "\n"
      total_amount += element.charge
    end

    # 푸터 행 추가
    result += "대여료는 #{total_amount}입니다.\n"
    result += "적립 포인트는 #{frequent_renter_points}입니다."
    result
  end
end
