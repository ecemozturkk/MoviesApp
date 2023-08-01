import UIKit
 
class GlobalPicker: UIViewController {
    var stringArray: [String]!
    var onDone: ((Int) -> Void)?
    var onCancel: (() -> Void)?
    let pickerView = UIPickerView()
    let toolBar = UIToolbar()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        pickerView.frame = CGRect(x: 0, y: view.frame.height - 280, width: view.frame.width, height: 280)
        toolBar.frame = CGRect(x: 0, y: view.frame.height - 280 - 44, width: view.frame.width, height: 44)
        toolBar.backgroundColor = .clear
        pickerView.backgroundColor = UIColor(named: "bg")
    }

    @objc func doneTapped() {
        onDone?(pickerView.selectedRow(inComponent: 0))
        dismiss(animated: true, completion: nil)
    }

    @objc func cancelTapped() {
        onCancel?()
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            
        pickerView.dataSource = self
        pickerView.delegate = self
        view.backgroundColor = .clear
        pickerView.setValue(UIColor(named: "fontColor2"), forKeyPath: "textColor")
        doneButton.tintColor = UIColor(named: "fontColor")
        cancelButton.tintColor = UIColor(named: "fontColor")
        toolBar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)

        view.addSubview(pickerView)
        view.addSubview(toolBar)
    }
}

extension GlobalPicker: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stringArray.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return stringArray[row]
    }
}
