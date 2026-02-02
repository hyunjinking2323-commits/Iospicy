나를 돌아보는 과정
배움

        let button1 = makeButton(title: "7")
        let button2 = makeButton(title: "8")
        let button3 = makeButton(title: "9")
        let button4 = makeButton(title: "+")
        
        let firstStackView = makeHorizontalStackView([button1, button2, button3, button4])
        
        view.addSubview(firstStackView)
        firstStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
        }
        
        let button5 = makeButton(title: "4")
        let button6 = makeButton(title: "5")
        let button7 = makeButton(title: "6")
        let button8 = makeButton(title: "-")
        
        let secondStackView = makeHorizontalStackView([button5, button6, button7, button8])
        
        view.addSubview(secondStackView)
        secondStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
        }
        
        let button9 = makeButton(title: "1")
        let button10 = makeButton(title: "2")
        let button11 = makeButton(title: "3")
        let button12 = makeButton(title: "*")
        
        let thridStackView = makeHorizontalStackView([button9, button10, button11, button12])
        
        view.addSubview(thridStackView)
        thridStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(80)
        }
        
        let button13 = makeButton(title: "AC")
        let button14 = makeButton(title: "0")
        let button15 = makeButton(title: "=")
        let button16 = makeButton(title: "/")
        
        let fourthStackView = makeHorizontalStackView([button13, button14, button15, button16])
        // 4열 계산기 배열 구성을 위한 버튼 타이틀 목록 (행 단위로 4개씩)
        let titles = ["7", "8", "9", "+",
                      "4", "5", "6", "-",
                      "1", "2", "3", "*",
                      "AC", "0", "=", "/"]
        



------이렇게 긴 줄을  이렇게 단축시킬 수 있는 것을 알았다. -------



        
        // titles 배열을 4개씩 끊어 2차원 배열(행)로 변환
        let rows: [[String]] = stride(from: 0, to: titles.count, by: 4).map { start in
            let end = min(start + 4, titles.count)
            return Array(titles[start..<end])
        }
        
        // forEach를 사용해 각 행을 처리: 버튼 생성 → 가로 스택뷰 → 세로 스택에 추가
        rows.forEach { rowTitles in
            let buttons = rowTitles.map { makeButton(title: $0) }
            let horizontalStack = makeHorizontalStackView(buttons)
            verticalStackView.addArrangedSubview(horizontalStack)
        }
        
        // 메인 세로 스택뷰 추가 및 제약
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints {
            $0.top.equalTo(label.snp.bottom).offset(60)   // 라벨 아래 60 간격
            $0.centerX.equalToSuperview()                 // 수평 중앙 정렬
            $0.width.equalTo(350)                         // 고정 너비 350
            $0.height.equalTo(350)                        // 고정 높이 (5행 기준)
        }
    }
    
  
