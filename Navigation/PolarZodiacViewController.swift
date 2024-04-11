import UIKit

class PolarZodiacViewController: UIViewController {
    
    var polarZodiac: Zodiac?
    
    private lazy var polarZodiacStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 21
        
        let zodiacNameLabel = UILabel()
        zodiacNameLabel.textAlignment = .center
        zodiacNameLabel.font = .systemFont(ofSize: 24, weight: .regular)
        zodiacNameLabel.text = "\(polarZodiac?.oppositeSignName ?? "LI-BRUH")"
        zodiacNameLabel.textColor = .white
        
        let zodiacImageView = UIImageView()
        zodiacImageView.image = UIImage(named: "\(polarZodiac?.oppositeSign ?? "Libra")")
        zodiacImageView.contentMode = .scaleAspectFill

        stackView.addArrangedSubview(zodiacNameLabel)
        stackView.addArrangedSubview(zodiacImageView)
        
        return stackView
    }()
    
    private lazy var redAndBlueButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        
        let redButton = UIButton()
        redButton.setTitle("წითელი", for: .normal)
        redButton.backgroundColor = .red
        redButton.titleLabel?.font = .systemFont(ofSize: 16)
        redButton.layer.cornerRadius = 8
        redButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        let blueButton = UIButton()
        blueButton.setTitle("ლურჯი", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.titleLabel?.font = .systemFont(ofSize: 16)
        blueButton.layer.cornerRadius = 8
        blueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        stackView.addArrangedSubview(redButton)
        stackView.addArrangedSubview(blueButton)
    
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setBackground()
    }

    func setupUI() {
        view.addSubview(polarZodiacStackView)
        view.addSubview(redAndBlueButtons)
        
        polarZodiacStackView.translatesAutoresizingMaskIntoConstraints = false
        redAndBlueButtons.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            polarZodiacStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            polarZodiacStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            redAndBlueButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            redAndBlueButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            redAndBlueButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
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
    PolarZodiacViewController()
}
