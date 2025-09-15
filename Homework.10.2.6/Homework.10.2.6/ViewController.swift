//
//  ViewController.swift
//  Homework.10.2.6
//
//  Created by Sergey A on 22.03.2025.
//

import UIKit

class ViewController: UIViewController {
    //1 массив данных +
    //2 таблица +
    //3 data source -> protocol под который подписываем класс с таблицей +
    //4 реализуем протокол +
    //  4.1 - указываем сколько ячеек - берем из массива 1 +
    //  4.2 - настроить конретную ячейку+
    //  4.3 - создать кастомную ячейку+
    
    var posts: [PostData] = PostData.getData()
    
    lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(CustomCell.self, forCellReuseIdentifier: "cell")
        $0.separatorStyle = .none
        
        return $0
    }(UITableView(frame: view.frame, style: .plain))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
    }
    
}


// MARK: - Extensions

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomCell {
            cell.selectionStyle = .none
            let post = posts[indexPath.row]
            cell.configCell(postData: post)
            
            return cell
        }
        return UITableViewCell()
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        
        let detailVC = DetailVC(post: post)
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

