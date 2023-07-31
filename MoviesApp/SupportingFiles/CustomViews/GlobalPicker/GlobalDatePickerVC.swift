import UIKit

class GlobalDateTimePicker: UIViewController {
    var onDone: ((Date) -> Void)?
    var onCancel: (() -> Void)?
    let datePicker = UIDatePicker()
    let toolBar = UIToolbar()
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
    let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        datePicker.frame = CGRect(x: 0, y: view.frame.height - 300, width: view.frame.width, height: 280)
        toolBar.frame = CGRect(x: 0, y: view.frame.height - 280 - 44, width: view.frame.width, height: 44)
        toolBar.backgroundColor = .clear
        datePicker.backgroundColor = .white
        datePicker.minimumDate = Date()
    }

    @objc func doneTapped() {
        onDone?(datePicker.date)
        dismiss(animated: true, completion: nil)
    }

    @objc func cancelTapped() {
        onCancel?()
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = UIDatePickerStyle.wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.datePickerMode = .dateAndTime
        view.backgroundColor = .clear

        doneButton.tintColor = .black
        cancelButton.tintColor = .black
        toolBar.setItems([cancelButton, flexibleSpace, doneButton], animated: false)

        view.addSubview(datePicker)
        view.addSubview(toolBar)
    }
}
