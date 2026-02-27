
import UIKit
import SnapKit

class FirstViewController: UIViewController {
    static let identifier = "FirstViewController"
    let tableView = UITableView()
    
    let datas: [Menu] = [
        .init(image: UIImage(systemName: "applelogo"), name: "애플로고"),
        .init(image: UIImage(systemName: "applepencil"), name: "애플펜슬"),
        .init(image: UIImage(systemName: "apple.intelligence"), name: "애플인텔리전스"),
        .init(image: UIImage(systemName: "apple.terminal"), name: "애플터미널")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        
        configureUI()
        setConstraints()
    }
    
    private func configureUI() {
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(
            FirstTableViewCell.self,
            forCellReuseIdentifier: String(describing: FirstTableViewCell.self)
        )
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}




extension FirstViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self), for: indexPath) as? FirstTableViewCell else {
            return .init()
        }

        let data = datas[indexPath.row]
        cell.configure(data: data)
        return cell
    }

}

