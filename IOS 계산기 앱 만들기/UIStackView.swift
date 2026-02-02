//
//  Untitled.swift
//  Calculator App
//
//  Created by t2025-m0239 on 2026.01.27.
//



import UIKit
import SnapKit

let label = UILabel()
let button = UIButton()
//let stackView = UIStackView()

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
//    override func makeHorizontalStackView(
    private func configureUI() {
        view.backgroundColor = .black
        label.text = "12345"
        label.textColor = .white
        label.textAlignment = .right
        label.font = .boldSystemFont(ofSize: 60)
        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)
        button.layer.cornerRadius = 40
        
        [label, button].forEach { view.addSubview($0) }
        
        label.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().offset(-30)
            $0.top.equalTo(200)
            $0.height.equalTo(100)
            
            button.snp.makeConstraints {
                $0.height.width.equalTo(80)
                
            }
        }
    }
}


//Axis - 가로,세로 스택 뷰 결정
//Spacing - 사이여백
//distributed - 균등하게 배치
//Distribution - 하위 뷰의 크기 배분 결정
//Fill - 모든 뷰를 가득채움
//Alignment - 하위 뷰의 위치 결정


//🧑🏻‍💻 `UIStackView` 을 사용해서 4개의 버튼을 모아 가로 스택뷰 생성. 왼쪽과 같이 구성해보세요.
//
//- **`UIButton` 속성**
//    - `font = .boldSystemFont(ofSize: 30)`
//    - `backgroundColor = UIColor(red: 58/255, green: 58/255, blue: 58/255, alpha: 1.0)`
//    - `height = 80`
//    - `width = 80`
//    - `layer.cornerRadius = 40`
//- **`horizontalStackView` 속성**
//    - `axis = .horizontal`
//    - `backgroundColor = .black`
//    - `spacing = 10`
//    - `distribution = .fillEqually`
//- **`horizontalStackView AutoLayout`**
//    - height = 80
