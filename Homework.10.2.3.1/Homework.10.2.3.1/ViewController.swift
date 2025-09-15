//
//  ViewController.swift
//  Homework.10.2.3.1
//
//  Created by Sergey A on 15.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var viewWidth  = view.frame.width
    lazy var viewHeight = view.frame.height
        
    // логотип
    lazy var logoImage: UIImageView = {
        let image = UIImage(named: "ligaStroyLogo")
        $0.image = image
        $0.frame = CGRect(x: view.frame.minX + 20, y: view.frame.minY + 50, width: 80, height: 50)
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.backgroundColor = .clear
        $0.layer.cornerRadius = 0
        return $0
    }(UIImageView())
    
    // слоган
    lazy var sloganLabel = createLabel(text: "Сервис квартирных решений \nот сделки до отделки", origin: CGPoint(x: logoImage.frame.minX, y: logoImage.frame.maxY + 20), fontSize: 18, weight: .bold, color: .white)
    
    // белый фон для Купить
    lazy var buyContextView = createImageView(image: "buy", frame: CGRect(x: logoImage.frame.minX, y: sloganLabel.frame.maxY + 30, width: viewWidth - 40, height: 130), cornerRadius: 10, backgroundColor: .white)
    
    //  купитьЛейбл
    lazy var buyLabel: UILabel = createLabel(text: "Купить", origin: CGPoint(x: buyContextView.frame.minX + 10, y: buyContextView.frame.minY + 15), fontSize: 12, weight: .bold, color: .black)
    
    // подберемЛейбл
    lazy var selectLabel: UILabel = createLabel(text: "Подберём подходящий \nобъект", origin: CGPoint(x: buyLabel.frame.minX, y: buyLabel.frame.maxY + 5), fontSize: 12, weight: .light, color: UIColor(red: 0.123, green: 0.109, blue: 0.109, alpha: 0.8))
    
    
    
    // кнопка перехода в описание
    private lazy var buttonToDescription: UIButton = {
        let image = UIImage(named: "Vector 10")
        $0.setImage(image, for: .normal)
        $0.frame = CGRect(x: buyContextView.frame.maxX - 20, y: buyContextView.frame.minY + 15, width: 6, height: 12)
        $0.tintColor = .systemGray
        $0.addAction(action, for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    // Action
    lazy var action: UIAction = UIAction { [weak self] btn in
      //  guard let sender = btn.sender as? UIButton else { return }
        let secVC = SecondVC()
        secVC.buildingName = self?.buildingsNameLabel.text ?? ""
        secVC.complexImage = self?.complexImageView.image
        secVC.priceLabelText = self?.priceLabel.text ?? ""
        secVC.addressLabelText = self?.addressLabel.text ?? ""
        
        self?.navigationController?.pushViewController(secVC, animated: true)
    }
    
    
    
    
    lazy var blackImageView: UIImageView = {
        $0.backgroundColor = .black
        $0.frame = CGRect(x: 0, y: 0, width: viewWidth, height: buyContextView.frame.maxY + 30)
        
        return $0
    }(UIImageView())
    
    
    // вторая половина (белая)
    // услугиЛейбл
    lazy var uslugiLabel: UILabel = createLabel(text: "Услуги", origin: CGPoint(x: buyContextView.frame.minX, y: blackImageView.frame.maxY + 25), fontSize: 20, weight: .bold, color: .black)
    
    // страхование Фон и Лейбл
    lazy var coverageContextView: UIImageView = {
        $0.backgroundColor = #colorLiteral(red: 0.9004740119, green: 0.9303863645, blue: 0.9984540343, alpha: 1)
        $0.frame = CGRect(x: uslugiLabel.frame.minX, y: uslugiLabel.frame.maxY + 15, width: viewWidth - 40, height: 90)
        $0.layer.cornerRadius = 10
        return $0
    }(UIImageView())
    
    // Страхование
    lazy var coverageLabel: UILabel = createLabel(text: "Страхование", origin: CGPoint(x: coverageContextView.frame.minX + 15, y: coverageContextView.frame.minY + 15), fontSize: 14, weight: .bold, color: .black)
    lazy var coverageDiscriptionLabel: UILabel = createLabel(text: "Защитите имущество \nздоровье и жизнь", origin: CGPoint(x: coverageLabel.frame.minX, y: coverageLabel.frame.maxY + 5), fontSize: 14, weight: .light, color: UIColor(red: 0.123, green: 0.109, blue: 0.109, alpha: 0.8))
    
    
    // Жилые комплексы
    lazy var livingBuildingsLabel: UILabel = createLabel(text: "Жилые комплексы", origin: CGPoint(x: coverageContextView.frame.minX, y: coverageContextView.frame.maxY + 18), fontSize: 20, weight: .bold, color: .black)
    
    // контекст Комплекса
    lazy var livingBuildingsContextView: UIImageView = createImageView(image: "slimBuildingsContext", frame: CGRect(x: livingBuildingsLabel.frame.minX, y: livingBuildingsLabel.frame.maxY + 18, width: viewWidth - 40, height: 200), cornerRadius: 10, backgroundColor: #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1))
    
    // фото комплекса
    lazy var complexImageView: UIImageView = createImageView(image: "complex", frame: CGRect(x: coverageContextView.frame.minX, y: livingBuildingsLabel.frame.maxY + 18, width: viewWidth - 40, height: 125), cornerRadius: 10)
    
    // Ольховый квартал
    lazy var buildingsNameLabel: UILabel = createLabel(text: "Ольховый Kвартал", origin: CGPoint(x: complexImageView.frame.minX + 10, y: complexImageView.frame.maxY + 5), fontSize: 14, weight: .bold, color: .black)
    
    // price
    lazy var priceLabel: UILabel = createLabel(text: "от 8 029 445 ₽", origin: CGPoint(x: buildingsNameLabel.frame.minX, y: buildingsNameLabel.frame.maxY + 5), fontSize: 14, weight: .bold, color: .black)
    
    // адрес
    lazy var addressLabel: UILabel = createLabel(text: "Москва, поселение Сосенское, деревня Столбово", origin: CGPoint(x: buildingsNameLabel.frame.minX, y: priceLabel.frame.maxY + 5), fontSize: 12, weight: .light, color: UIColor(red: 0.123, green: 0.109, blue: 0.254, alpha: 0.8))
    
    
    
    
    
    
    
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        // title = "Main"
        
        view.addSubviews(blackImageView, logoImage, sloganLabel, buyContextView, buyLabel, selectLabel, buttonToDescription, uslugiLabel, coverageContextView, coverageLabel, coverageDiscriptionLabel, livingBuildingsLabel, livingBuildingsContextView, complexImageView, buildingsNameLabel, priceLabel, addressLabel)
    }
    
    
    
    
    // MARK: - Functions
    
    // создаем картинки
    
    private func createImageView(image: String, frame: CGRect, isCircle: Bool = false, cornerRadius: CGFloat, backgroundColor: UIColor? = nil) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = frame
        imageView.backgroundColor = backgroundColor
        if isCircle {
            imageView.layer.cornerRadius = frame.width / 2
        } else {
            imageView.layer.cornerRadius = cornerRadius
        }
        imageView.clipsToBounds = true
        
        return imageView
    }
    
    
    func createLabel(text: String, origin: CGPoint, fontSize: CGFloat, weight: UIFont.Weight, color: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textColor = color
        // label.backgroundColor = .gray
        label.font = .systemFont(ofSize: fontSize, weight: weight)
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.sizeToFit()
        label.frame.origin = origin
        
        return label
    }
    
}


extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
