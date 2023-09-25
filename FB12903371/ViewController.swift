import UIKit

class ViewController: UIViewController {

    @IBOutlet private var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        for subview in stackView.arrangedSubviews {
            if let label = subview as? UILabel, let font = label.font {
                label.text = "Expected: \(label.text ?? "")\nActual: \(font.fontName), \(font.pointSize)"
            }
        }

        printSystemFonts()
    }

    private func printSystemFonts() {
        print("ℹ️ Custom fonts availability:")
        for family in UIFont.familyNames {
            guard isCustomFont(family) else { continue }

            for name in UIFont.fontNames(forFamilyName: family) {
                let font = UIFont(name: name, size: 20)
                print("\t• \(font != nil ? "✅" : "❌") \(name)")
            }
        }
    }

    private func isCustomFont(_ family: String)  -> Bool {
        ["SF Pro Display", "SF Compact Rounded"].contains(family) || family.contains("Nunito")
    }
}
