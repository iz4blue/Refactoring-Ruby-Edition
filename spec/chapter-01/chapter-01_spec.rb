# TODO: $LOAD_PATH 를 잘못 지정하였는지 rubymine 에서는 'Run All tests 가 수행 안됨'
$LOAD_PATH << '.'
require 'chapter-01/chapter-01'

RSpec.describe Customer, "#statement" do
  context '코딩이 잘 되었는지 파악한다' do
    before(:each) do
      @m_01 = Movie.new('movie-01', Movie::NEW_RELEASE)
      @m_02 = Movie.new('movie-02', Movie::REGULAR)
    end

    it '신규 유져 생성 및 영화 랜탈 테스트' do
      joseph = Customer.new('joseph')

      rent_1 = Rental.new(@m_01, 3)
      rent_2 = Rental.new(@m_02, 7)
      joseph.add_rental(rent_1)
      joseph.add_rental(rent_2)

      stdout = joseph.statement

      expect(stdout).to match('movie-01')
      expect(stdout).to match('movie-02')
      expect(stdout).to match('대여료는 18.5')
      expect(stdout).to match('적립 포인트는 3')
    end
  end
end
