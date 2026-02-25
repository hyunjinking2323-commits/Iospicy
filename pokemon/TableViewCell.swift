
import UIKit
import SnapKit
import Alamofire
import CoreData

final class TableViewCell: UITableViewCell {

    static let id = "TableViewCell"

    private let pokemonimageView: UIImageView = {

        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 30
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.systemGray2.cgColor
        imageView.clipsToBounds = true
        return imageView

    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        return label
    }()

    private let phoneNumber: UILabel = {
        let label = UILabel()
        label.text = "010-0000-0000"
        label.textColor = .black
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .right
        return label

    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureUI() {


        [pokemonimageView, nameLabel, phoneNumber].forEach {
            contentView.addSubview($0)
        }

        pokemonimageView.snp.makeConstraints {
            $0.size.equalTo(60)
            $0.leading.equalToSuperview().offset(20)
            $0.top.bottom.equalToSuperview().inset(10)
        }

        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(pokemonimageView)
            $0.leading.equalTo(pokemonimageView.snp.trailing).offset(20)
        }
        phoneNumber.snp.makeConstraints {
            $0.centerY.equalTo(pokemonimageView)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }

    func configureCell(phoneBookData: PhoneBook) {
        self.nameLabel.text = phoneBookData.name
        self.phoneNumber.text = phoneBookData.phoneNumber
        if let imageData = phoneBookData.image {
            self.pokemonimageView.image = UIImage(data: imageData, scale: 1.3)
        }
    }

}

