# 책과 다르게 코딩한 부분
- Movie.NEW_RELEASE 가 아닌 Movie::NEW_RELEASE 로 바꾸어야 함
- p32 result 구문은 한글화 하여 보았음
- p32 each.movie.title => element.movie.title 로 변경함
- p43 when REGULAR: RegularPrice.new 가 아닌 when REGULAR; RegularPrice.new 로 변경함
- p43 나머지 다른 NEW_RELEASE 및 CHILDRENS 도 동일하게 변경함
- p49 include Price 가 아닌 include DefaultPrice 로 변경함
- p51 Movie class 에 initialize 가 변경되어야 함

```
def initialize(title, the_price_code)
  @title, @price = title, the_price_code
end
```

# 소감
- 테스트는 뒤에 나와 있다고는 하지만 테스트도 같이 설명하면서 진행하였으면 더 좋았을 듯 싶었다.
- 생각보다 정오표가 필요하여 이 책을 끝까지 읽으면서 뭔가 집중을 하게 되서 의외의 목표가 생겼다.
- rspec 를 빈 프로젝트에 처음 붙여 보았는데, 생각보다 쉽게 잘 붙였다.

