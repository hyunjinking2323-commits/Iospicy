import Foundation
// Lv. 1
//    - [ ]  1에서 9까지의 서로 다른 임의의 수 3개를 정하고 맞추는 게임입니다
//    - [ ]  정답은 랜덤으로 만듭니다.(1에서 9까지의 서로 다른 임의의 수 3자리)
func makeAnswer() -> Int {
    var answerSet = Set<Int>()
    while answerSet.count < 3 {
        answerSet.insert(Int.random(in: 1...9))
    }
    // map의 transform 클로저 상세 설명:
    // - 타입: (Int) -> String  (Int 하나를 받아 String 하나를 반환)
    // - 동작: 셔플된 Int 배열의 각 요소를 문자열로 변환합니다. (예: 3 -> "3")
    // - 목적: 아래에서 문자열 보간으로 세 자리를 쉽게 이어붙이기 위해 [String]으로 만들어 둡니다.
    // - 참고: Xcode 자리 표시자에 보이는 throws는 변환 과정에서 에러를 던질 수도 있음을 일반적으로 나타내지만, 여기서는 사용하지 않습니다.
    
let answerArray = Array(answerSet).shuffled().map { String($0) }
let answerString = "\(answerArray[0])\(answerArray[1])\(answerArray[2])"
return Int(answerString)!
}
print(makeAnswer())



