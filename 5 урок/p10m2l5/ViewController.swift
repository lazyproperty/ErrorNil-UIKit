//error nil

import UIKit




class ViewController: UIViewController {

    //1 массив данных
    var data = TableData.mocData()
    
    //2 таблица
    lazy var tableView: UITableView = {
        //3 соединение таблицы с массивом
        $0.dataSource = self
        $0.delegate = self
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        //$0.backgroundColor = .gray
        
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        title = "Main"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }


}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        data.count
    }
    
    // говорит сколько ячеек будет в таблице в конкретной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data[section].count
    }
    
    //говорит как будет выглядеть каждая ячейка
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //ВАЖНО!! достать ячейку из памяти таблицы dequeueReusableCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let item = data[indexPath.section][indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        
        config.text = item.text
        config.secondaryText = item.description
        config.image = UIImage(systemName: item.image)
        cell.contentConfiguration = config
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section{
        case 0:
            return "First section"
        case 1:
            return "Second section"
        default:
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section{
        case 0:
            return "lorem ipusm dolor sit amet consectetur adipiscing elit ut aliquam"
        case 1:
            return "second footer"
        default:
            return nil
        }
    }
    
    
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.section][indexPath.row]
        print(item)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            
            
            //1 удалить из массива
            data[indexPath.section].remove(at: indexPath.row)
            
            //2 удалить из таблицы
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
    }
}
