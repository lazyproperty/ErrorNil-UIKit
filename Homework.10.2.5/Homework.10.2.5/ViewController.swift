//
//  ViewController.swift
//  Homework.10.2.5
//
//  Created by Sergey A on 19.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    
    // 1 data
    var data = TableData.getAll()
    
    // 2 table
    lazy var tableView: UITableView = {
        // 3
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        title = "10 поток"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    // количество секций
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    // количество ячеек в секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    
    // Сама ячейка и ее конфигурация в таблице
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = data[indexPath.section][indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        config.text = item.name
        config.image = UIImage(systemName: item.image)
        config.secondaryText = item.description
        cell.contentConfiguration = config

        if item.isCompleted {
            cell.backgroundColor = .systemGray6
            cell.accessoryType = .checkmark
        } else {
            cell.backgroundColor = .systemBackground
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    // header  для секции
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return  "USERS"
        case 1:
            return "MODULES"
        default :
            return nil
        }
    }
    
    // footer для секции
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let total = data[section].count  // фиксируем общее количество ячеек(модулей или пользователей) в секции
        let completed = data[section].filter { $0.isCompleted }.count  // выбираем только со свойством "пройденные"

        switch section {
        case 0:
            return "Количество пользователей: \(total)"
        case 1:
            return "Количество модулей: \(total). Пройдено: \(completed)"
        default:
            return nil
        }
    }
    
}


// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.section][indexPath.row]
        print(item)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // удаление ячеек из базы данных и таблицы
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        tableView.reloadRows(at: [indexPath], with: .automatic) // Обновляем текущую ячейку
        tableView.reloadSections([indexPath.section], with: .automatic) // Обновляем футер
    }
    
    // свайп вправо
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let passedState = UIContextualAction(style: .normal, title: "Пройдено") { action, view, completionHandler in
            self.data[indexPath.section][indexPath.row].isCompleted.toggle() // Переключаем состояние
            tableView.reloadRows(at: [indexPath], with: .automatic) // Обновляем текущую ячейку
            tableView.reloadSections([indexPath.section], with: .automatic) // Обновляем футер
            completionHandler(true)
        }
        
        passedState.backgroundColor = .systemBlue // Цвет кнопки свайпа
        return UISwipeActionsConfiguration(actions: [passedState])
    }
}


