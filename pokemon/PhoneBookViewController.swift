    //
    //  PhoneBookViewController.swift
    //  pokemon phone number
    //
    //  Created by t2025-m0239 on 2026.02.21.
    //

import UIKit
import SnapKit
import Alamofire
import CoreData

class PhoneBookViewController: UIViewController {

    static var container: NSPersistentContainer?

    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "")
        imageView.layer.cornerRadius = 90
        imageView.layer.borderWidth = 3.4
        imageView.layer.borderColor = UIColor.systemGray2.cgColor
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var changeTapButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(UIColor.systemGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .black)
        button.addTarget(self, action: #selector(imageChangeTapped), for: .touchUpInside)
        return button
    }()
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        return textField
    }()
    let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    override func viewWillAppear(_ animated: Bool) {
        setNavigationController()

    }

    private func configureUI() {
        view.backgroundColor = .white

        [profileImageView, changeTapButton, nameTextField, phoneNumberTextField].forEach {
            view.addSubview($0)
        }
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(180)
            $0.top.equalToSuperview().offset(120)
            $0.centerX.equalToSuperview()
        }
        changeTapButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(changeTapButton.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(40)
        }
        phoneNumberTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(360)
            $0.height.equalTo(40)
        }

    }
    private func fetchDataByAlamofire<T: Decodable>(url: URL, completion: @escaping (Result<T, AFError>) -> Void) {
        AF.request(url).responseDecodable(of: T.self) { response in
            completion(response.result)
        }
    }

    @objc
    private func imageChangeTapped() {

        let randomNumber = Int.random(in: 1...1000)

        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(randomNumber)") else { return }

            // fetchData()
        fetchDataByAlamofire(url: url) { [weak self] (result: Result<API, AFError>) in

            guard let self else { return }
            switch result {
                case .success(let pokemon):
                    guard let imageUrl = pokemon.sprites.frontDefault else {
                        print("이미지 없음")
                        return
                    }
                        // Alamofire 를 사용하면 이미지 로드
                    AF.request(imageUrl).responseData { [weak self] response in

                        guard let self else { return }

                        if let data = response.data, let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self.profileImageView.image = image
                            }
                        }
                    }

                case .failure(let error):
                    print("API 실패: \(error)")

            }
        }
    }


    @objc private func cancelTapped() {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    @objc private func applyTapped() {
        guard let name = nameTextField.text, !name.isEmpty,
              let phone = phoneNumberTextField.text, !phone.isEmpty else {
            return
        }
        let imageData = profileImageView.image?.pngData() ?? Data()
        createData(name: name, phoneNumber: phone, image: imageData)
        navigationController?.popViewController(animated: true)

    }
}


extension PhoneBookViewController {
    private func setNavigationController() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = "연락처 추가"

            // iOS15+ (특히 최신 iOS)에서는 Appearance로 버튼 색을 지정.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        appearance.shadowColor = .clear
        appearance.shadowImage = UIImage()

            // "적용" 같은 일반 BarButtonItem 색.
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.systemBlue
        ]

            // Back 버튼도 동일하게 적용.
        appearance.buttonAppearance = buttonAppearance
        appearance.backButtonAppearance = buttonAppearance

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance

            // (아이콘/화살표 tint도 같이 맞추기).
        navigationController?.navigationBar.tintColor = .systemBlue

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "적용",
            style: .plain,
            target: self,
            action: #selector(buttonTapped)
        )

    }
}

@objc func buttonTapped() {

    navigationController?.popViewController(animated: true)
}


extension PhoneBookViewController {

        // MARK: alert 생성하는 메서드.
    func showAlert(error: CustomError) {
        let alert = UIAlertController(title: "오류", message: error.errorTitle, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}

extension PhoneBookViewController {
    func createData(name: String, phoneNumber: String, image: Data) {
        guard let container = PhoneBookViewController.container else { return }
        let context = container.viewContext

        let entityName = PhoneBook.entity().name ?? "PhoneBook"
        guard let entity = NSEntityDescription.entity(forEntityName: entityName, in: context) else { return }

        let newPhoneBook = NSManagedObject(entity: entity, insertInto: context)
        newPhoneBook.setValue(name, forKey: "name")
        newPhoneBook.setValue(phoneNumber, forKey: "phoneNumber")
        newPhoneBook.setValue(image, forKey: "image")

        do {
            try context.save()
            print("문맥 저장 성공")
        } catch {
            print("문맥 저장 실패: \(error)")
        }
    }
    private func createBookList() {
        let nameData = nameTextField.text ?? ""
        let phoneNumberData = phoneNumberTextField.text ?? ""
        if nameData.isEmpty || phoneNumberData.isEmpty {
            showAlert(error: .mustInput)
            return
        }
        guard let image = self.profileImageView.image?.pngData() else {
            showAlert(error: .mustImage)
            return
        }

        createData(name: nameData, phoneNumber: phoneNumberData, image: image)
    }

}



