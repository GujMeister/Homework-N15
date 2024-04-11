import UIKit

class ZodiacDetailViewController: UIViewController {
    
    var zodiac: Zodiac?
    
    private lazy var zodiacNameAndImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 21
        
        let zodiacNameLabel = UILabel()
        zodiacNameLabel.textAlignment = .center
        zodiacNameLabel.font = .systemFont(ofSize: 24, weight: .regular)
        zodiacNameLabel.text = "\(zodiac?.name ?? "LI-BRUH")"
        zodiacNameLabel.textColor = .white
        
        let zodiacImageView = UIImageView()
        zodiacImageView.image = UIImage(named: "\(zodiac?.imageName ?? "Libra")")
        zodiacImageView.contentMode = .scaleAspectFill

        stackView.addArrangedSubview(zodiacImageView)
        stackView.addArrangedSubview(zodiacNameLabel)
        
        zodiacImageView.translatesAutoresizingMaskIntoConstraints = false
        zodiacImageView.heightAnchor.constraint(equalTo: zodiacImageView.widthAnchor).isActive = true
        
        return stackView
    }()

    private lazy var zodiacDescriptionLabel: UITextView = {
        let textView = UITextView()
        textView.textColor = UIColor(hex: "8B8B8B")
        textView.backgroundColor = .clear
        textView.textAlignment = .center
        textView.font = .systemFont(ofSize: 13, weight: .regular)
        textView.text = zodiac?.description ?? "CHEMI SAXELIA JONI, SHESHLILI JONI"
        return textView
    }()
    
    private lazy var polarZodiacSignButton: UIButton = {
        let button = UIButton()
        button.setTitle("პოლარული ნიშანი", for: .normal)
        button.backgroundColor = UIColor(hex: "5000B6")
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        
        button.addAction(UIAction(handler: { _ in
            self.didTapPolarZodiacSignButton()
        }), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setupUI()
    }
    
    func didTapPolarZodiacSignButton() {
        let vc = PolarZodiacViewController()
        vc.polarZodiac = zodiac
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func setupUI() {
        
        view.addSubview(zodiacNameAndImageStackView)
        view.addSubview(zodiacDescriptionLabel)
        view.addSubview(polarZodiacSignButton)

        zodiacNameAndImageStackView.translatesAutoresizingMaskIntoConstraints = false
        zodiacDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        polarZodiacSignButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            zodiacNameAndImageStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            zodiacNameAndImageStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            zodiacNameAndImageStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            zodiacDescriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            zodiacDescriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            zodiacDescriptionLabel.topAnchor.constraint(equalTo: zodiacNameAndImageStackView.bottomAnchor, constant: 30),
            zodiacDescriptionLabel.bottomAnchor.constraint(equalTo: polarZodiacSignButton.topAnchor, constant: -45),
            
            polarZodiacSignButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            polarZodiacSignButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            polarZodiacSignButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            polarZodiacSignButton.heightAnchor.constraint(equalToConstant: 45)
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
    ZodiacDetailViewController()
}
