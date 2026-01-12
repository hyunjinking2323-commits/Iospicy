import UIKit


class Calculator {
    let ad = AddOperation()
    let su = SubstractOperation()
    let mu = MultiplyOperation()
    let di = DivideOperation()
    let re = Remainder()
    
    
    func operation(a: Double, b: Double, op: String) -> Double {
        switch op {
        case "+":
            return ad.pls(a: a, b: b)
        case "-":
            return su.sub(a: a, b: b)
        case "*":
            return mu.mul(a: a, b: b)
        case "/":
            return di.div(a: a, b: b)
        case "%":
            return Double(re.rem(a: Int(a), b: Int(b)))
        default:
            print("정의되지 않음")
            return 0
        }
    }
}

class AddOperation {
    func pls(a: Double, b: Double) -> Double {
        return a + b
    }
}

class SubstractOperation {
    func sub(a: Double, b: Double) -> Double {
        return a - b
    }
}

class MultiplyOperation {
    func mul(a: Double, b: Double) -> Double {
        return a * b
    }
}

class DivideOperation{
    func div(a: Double, b: Double) -> Double {
        if b == 0 {
            print("정의되지 않음")
            return 0
        }
        return a / b
    }
}

class Remainder {
    func rem(a: Int, b: Int) -> Int {
        if b == 0 {
            print("정의되지 않음")
            return 0
        }
        return a % b
    }
}

// 실행
    
let calculator = Calculator()
    func printResult(_ result: Double) {
        if result == Double(Int(result)) {
            print(Int(result))
        } else {
            print(result)
        }
    }
printResult(calculator.operation(a: 10, b: 5, op: "+" ))//15.0
printResult(calculator.operation(a: 10, b: 5, op: "-" ))//5.0
printResult(calculator.operation(a: 10, b: 5, op: "*" ))//50.0
printResult(calculator.operation(a: 10, b: 5, op: "/" ))//2.0
printResult(calculator.operation(a: 10, b: 5, op: "%" ))//0.0
printResult(calculator.operation(a: 10, b: 100, op: "%" ))//10.0
printResult(calculator.operation(a: 100, b: 0, op: "%" ))//정의되지 않음

        
        
       
  
