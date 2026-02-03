//import UIKit
//import SnapKit
//
//
//
//
//class ViewController: UIViewController {
//    
//    // 결과(표시) 값을 나타내는 상단 라벨
//    let label = UILabel()
//    
//    // 메인 세로 스택뷰 (lazy init)
//    lazy var verticalStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .vertical
//        stack.backgroundColor = .black
//        stack.spacing = 10
//        stack.distribution = .fillEqually
//        return stack
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        configureUI()
//    }
//    
//    // 전체 UI 요소 생성 및 배치 로직
//    private func configureUI() {
//        // 전체 배경을 검정색으로 설정 (계산기 스타일)
//        view.backgroundColor = .black
//        
//        // 상단 결과 라벨 스타일 설정
//        label.textColor = .white
//        label.text = "0"
//        label.textAlignment = .right
//        label.font = .boldSystemFont(ofSize: 60)
//        
//        // 라벨 추가 및 오토레이아웃 제약 설정
//        view.addSubview(label)
//        label.snp.makeConstraints {
//            $0.leading.equalToSuperview().offset(30)  // 왼쪽 여백 30
//            $0.trailing.equalToSuperview().inset(30)  // 오른쪽 여백 30
//            $0.top.equalToSuperview().offset(200)     // 상단에서 200 아래
//            $0.height.equalTo(100)                    // 고정 높이 100
//        }
//        
//        // 4열 계산기 배열 구성을 위한 버튼 타이틀 목록 (행 단위로 4개씩)
//        let titles = ["7", "8", "9", "+",
//                      "4", "5", "6", "-",
//                      "1", "2", "3", "*",
//                      "AC", "0", "=", "/"]
//        
//        
//        // titles 배열을 4개씩 끊어 2차원 배열(행)로 변환
//        let rows: [[String]] = stride(from: 0, to: titles.count, by: 4).map { start in
//            let end = min(start + 4, titles.count)
//            return Array(titles[start..<end])
//        }
//        
//        // forEach를 사용해 각 행을 처리: 버튼 생성 → 가로 스택뷰 → 세로 스택에 추가
//        rows.forEach { rowTitles in
//            let buttons = rowTitles.map { makeButton(title: $0) }
//            let horizontalStack = makeHorizontalStackView(buttons)
//            verticalStackView.addArrangedSubview(horizontalStack)
//        }
//        
//        // 메인 세로 스택뷰 추가 및 제약
//        view.addSubview(verticalStackView)
//        verticalStackView.snp.makeConstraints {
//            $0.top.equalTo(label.snp.bottom).offset(60)   // 라벨 아래 60 간격
//            $0.centerX.equalToSuperview()                 // 수평 중앙 정렬
//            $0.width.equalTo(350)                         // 고정 너비 350
//            $0.height.equalTo(350)                        // 고정 높이 (5행 기준)
//        }
//    }
//    
//    // lv. 2 공통 버튼 생성 유틸리티: 타이틀/스타일/크기 지정 후 반환 (UIColor 제거, 기본색 사용)
//    private func makeButton(title: String) -> UIButton {
//        let button = UIButton(type: .system)
//        button.setTitle(title, for: .normal)
//        button.setTitleColor(.white, for: .normal)
//        button.titleLabel?.font = .boldSystemFont(ofSize: 30)
//        
//        // lv. 4, 5 연산자를 String으로 지정 후, if문 사용으로 버튼 색 분리
//        let operatorOrange: Set<String> = ["+", "-", "*", "/", "AC", "="]
//        
//        if operatorOrange.contains(title) {
//            
//            button.backgroundColor = UIColor(red: 255/255.0, green: 149/255.0, blue: 0/255.0, alpha: 1.0)
//        } else {
//            button.backgroundColor = UIColor(red: 58/255.0, green: 58/255.0, blue: 58/255.0, alpha: 1.0)
//        }
//        button.layer.cornerRadius = 40
//        button.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
//        return button
//    }
//    
//    // 전달받은 뷰 배열을 가로로 균등 배치하는 스택뷰 생성
//    private func makeHorizontalStackView(_ views: [UIView]) -> UIStackView {
//        let stackView = UIStackView(arrangedSubviews: views)
//        stackView.axis = .horizontal        // 가로 방향
//        stackView.backgroundColor = .black  // 배경색 일관성
//        stackView.spacing = 10              // 뷰 간 간격 10
//        stackView.distribution = .fillEqually  // 각 아이템 너비 균등 분배
//        return stackView
//    }
//    
//    // buttonClicked 메서드 (오타 수정)
//    
//    @objc
//    private func buttonClicked(_ sender: UIButton) {
//        guard let title = sender.currentTitle else { return }
//        switch title {
//        case "0","1","2","3","4","5","6","7","8","9":
//            label.text = (label.text ?? "") + title
//        case "AC":
//            label.text = "0"
//        default:
//            print("연산자 클릭: \(title)")
//        }
//    }
//}
