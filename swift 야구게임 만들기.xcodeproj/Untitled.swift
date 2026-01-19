import Foundation

class BaseballGame {
    func start() {
        print("< 숫자야구 게임 >")
        let answer = makeAnswer()
        
        while true {
            print("숫자를 입력하세요 (1~9 서로 다른 3자리)")
            guard let line = readLine(),
                  let guess = Int(line),
                  (100...999).contains(guess) else {
                print("올바르지 않은 입력값입니다")
                continue
            }
            
            let g1 = (guess / 100) % 10
            let g2 = (guess / 10) % 10
            let g3 = guess % 10
            
            guard g1 != g2, g1 != g3, g2 != g3 else {
                print("서로 다른 3자리 숫자를 입력하세요")
                continue
            }

            let (strike, ball) = compare(guess: guess, answer: answer)
            
            if strike == 3 {
                print("정답입니다!")
                break
            }
            print(hint(strike: strike, ball: ball))
        }
    }
    
    func makeAnswer() -> Int {
        var nums = Array(1...9)
        var ans = 0
        
        for _ in 0..<3 {
            let i = Int.random(in: 0..<nums.count)
            ans = ans * 10 + nums.remove(at: i)
        }
        return ans
    }
    
    func compare(guess: Int, answer: Int) -> (Int, Int) {
        let g1 = (guess / 100) % 10, g2 = (guess / 10) % 10, g3 = guess % 10
        let a1 = (answer / 100) % 10, a2 = (answer / 10) % 10, a3 = answer % 10
        
        var strike = 0, ball = 0
        
        if g1 == a1 { strike += 1 }
        else if g1 == a2 || g1 == a3 { ball += 1 }
        if g2 == a2 { strike += 1 }
        else if g2 == a1 || g2 == a3 { ball += 1 }
        if g3 == a3 { strike += 1 }
        else if g3 == a1 || g3 == a2 { ball += 1 }
        
        return (strike, ball)
    }
    
    func hint(strike: Int, ball: Int) -> String {
        switch (strike, ball) {
        case (0, 0): return "아웃!"
        case (let s, 0) where s > 0: return "\(s)S"
        case (0, let b) where b > 0: return "\(b)B"
        default: return "\(strike)S \(ball)B"
        }
    }
}

