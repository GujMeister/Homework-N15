import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    var filteredZodiacs: [Zodiac] = zodiacs
    
    private let hubLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "მიშა ცაგარელის ჰაბი"
        return label
    }()
    
    private let applicationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "8B8B8B")
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.text = "მოცემულ აპლიკაციაში შეგიძლიათ გაიგოთ თქვენი ზოდიაქოს ყველაზე გამოკვეთილი უნარები და თვისებები."
        return label
    }()
    
    private let searchStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        let searchLabel = UILabel()
        searchLabel.text = "ზოდიაქოს სახელი"
        searchLabel.textAlignment = .left
        searchLabel.textColor = .white
        searchLabel.font = .systemFont(ofSize: 12)
        
        let searchBar = UITextField()
        searchBar.backgroundColor = .clear
        searchBar.borderStyle = .roundedRect
        searchBar.layer.borderWidth = 1.0
        searchBar.layer.cornerRadius = 5.0
        searchBar.layer.borderColor = UIColor(hex: "DDDDDD").cgColor
        searchBar.textColor = .white

        let placeholderText = "მაგ: სასწორი"
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "7D7E83"),
            .font: UIFont.systemFont(ofSize: 12)
        ]

        searchBar.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: placeholderAttributes)
        
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stackView.addArrangedSubview(searchLabel)
        stackView.addArrangedSubview(searchBar)
        
        return stackView
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("შემდეგ", for: .normal)
        button.backgroundColor = UIColor(hex: "5000B6")
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 10
        
        button.addAction(UIAction(handler: { _ in
            self.didTapSearchButton()
        }), for: .touchUpInside)
        
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setupUI()
    }
    
    @objc func didTapSearchButton() {
        guard let searchText = searchStackView.subviews.compactMap({ $0 as? UITextField }).first?.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
            let alertController = UIAlertController(title: "ტექსტი არ არის შეყვანილი", message: "გთხოვთ შეიყვანოთ ზოდიაქოს სახელი მოსაძებნად", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        if let selectedZodiac = zodiacs.first(where: { $0.name == searchText }) {
            let vc = ZodiacDetailViewController()
            vc.zodiac = selectedZodiac
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alertController = UIAlertController(title: "ზოდიაქო არ მოიძებნა", message: "შეყვანილი ზოდიაქოს სახელი არ ემთხვევა არცერთ სახელს", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    func setupUI() {
        view.addSubview(hubLabel)
        view.addSubview(applicationDescriptionLabel)
        view.addSubview(searchStackView)
        view.addSubview(searchButton)
        
        hubLabel.translatesAutoresizingMaskIntoConstraints = false
        applicationDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        searchStackView.translatesAutoresizingMaskIntoConstraints = false
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            hubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
            hubLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 71),
            
            applicationDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            applicationDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            applicationDescriptionLabel.topAnchor.constraint(equalTo: hubLabel.bottomAnchor, constant: 20),
            
            searchStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            searchStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            searchStackView.topAnchor.constraint(equalTo: applicationDescriptionLabel.bottomAnchor, constant: 91),
            
            searchButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchButton.topAnchor.constraint(equalTo: searchStackView.bottomAnchor, constant: 25)
            
        ])
    }

    func setBackground() {
        let backgroundImage = UIImage(named: "Background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.frame = view.bounds
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
    }
    
}

#Preview() {
    ViewController()
}

// MARK: - Setup Hex color coding
extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


