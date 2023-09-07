import UIKit

struct Seat {
    let row: String
    let seatNumber: String
    var isBooked: Bool = false
    var isSelected: Bool = false
}

class SeatBookingVC: UIViewController {
    
    var perTicketPrice = 20
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var seatLabel: UILabel!
    @IBOutlet weak var totalPrice: UILabel!
    
    let seatHeight: CGFloat = 20
    let seatWidth: CGFloat = 20
    let gapSize: CGFloat = 12 // Normal space between cells
    let extraGapSize: CGFloat = 24 // Extra space after every 3 cells
    let selectedSeatColor = UIColor(red: 0.28, green: 0.81, blue: 1, alpha: 1)
    let availableSeatColor = UIColor.white
    let borderColor = UIColor.lightGray

    var seatsData: [[Seat]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(SeatCell.self, forCellWithReuseIdentifier: SeatCell.reuseIdentifier)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.isUserInteractionEnabled = true
        self.collectionView.isScrollEnabled = false
        self.navigationController?.navigationBar.tintColor = .black
        // Call a function to set up your seats data
        setupSeatsData()
        self.updateLabels()
    }

    func setupSeatsData() {
        let sections = ["A", "B", "C", "D", "E", "F"]
        let totalSeatsPerSection = 9

        for section in sections {
            var seats = [Seat]()
            for seatNumber in 1...totalSeatsPerSection {
                let seat = Seat(row: section, seatNumber: String(seatNumber))
                seats.append(seat)
            }
            seatsData.append(seats)
        }
    }
}


extension SeatBookingVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        if !seatsData[indexPath.section][indexPath.item].isSelected && countSelectedSeats() >= 10 {
            // If the seat is not selected and the user is trying to select more than 10 seats, show an alert
            let alert = UIAlertController(title: "Limit Exceeded", message: "You can only select up to 10 seats.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            // Toggle the seat selection status and update the labels
            seatsData[indexPath.section][indexPath.item].isSelected = !seatsData[indexPath.section][indexPath.item].isSelected
            collectionView.reloadData()
            updateLabels()
        }
    }

    // Helper function to count the number of selected seats
    private func countSelectedSeats() -> Int {
        var selectedCount = 0
        for sectionSeats in seatsData {
            for seat in sectionSeats {
                if seat.isSelected {
                    selectedCount += 1
                }
            }
        }
        return selectedCount
    }
}


extension SeatBookingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return seatsData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return seatsData[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCell.reuseIdentifier, for: indexPath) as? SeatCell else {
            fatalError("Unable to dequeue SeatCell.")
        }

        let seat = seatsData[indexPath.section][indexPath.item]
        cell.configure(with: seat)

        return cell
    }
}

extension SeatBookingVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Set the size of each seat cell
        return CGSize(width: seatWidth, height: seatHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // Add space between sections
        return UIEdgeInsets(top: gapSize, left: 0, bottom: gapSize, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        // Set the space between cells in a row
        return gapSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // Set the space between rows
        return gapSize
    }

    // Add section header view
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.reuseIdentifier, for: indexPath) as? SectionHeaderView else {
            fatalError("Unable to dequeue SectionHeaderView.")
        }

        let sectionName = "\(seatsData[indexPath.section].first?.row ?? "")"
        headerView.configure(with: sectionName)
        return headerView
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 100, height: seatHeight) // Customize the width and height of the header view as per your requirement
    }
}

class SectionHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeaderView"

    let sectionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(sectionLabel)

        // Set constraints for the sectionLabel to fill the header view
        NSLayoutConstraint.activate([
            sectionLabel.topAnchor.constraint(equalTo: topAnchor),
            sectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            sectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            sectionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func configure(with sectionName: String) {
        sectionLabel.text = sectionName
    }
}

class SeatCell: UICollectionViewCell {
    static let reuseIdentifier = "SeatCell"

    let selectedSeatColor = UIColor(red: 0.28, green: 0.81, blue: 1, alpha: 1)
    let availableSeatColor = UIColor.white
    let borderColor = UIColor.lightGray

    let seatImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    private func setupViews() {
        addSubview(seatImageView)

        // Set constraints for the seatImageView to fill the cell
        NSLayoutConstraint.activate([
            seatImageView.topAnchor.constraint(equalTo: topAnchor),
            seatImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            seatImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            seatImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func configure(with seat: Seat) {
        // Customize the appearance of the seat cell based on its state
        seatImageView.image = seat.isBooked ? UIImage(named: "booked_seat") : (seat.isSelected ? UIImage(named: "selected_seat") : UIImage(named: "available_seat"))
        contentView.backgroundColor = seat.isSelected ? selectedSeatColor : (seat.isBooked ? UIColor.lightGray : UIColor.white)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = seat.isSelected ? selectedSeatColor.cgColor : UIColor.gray.cgColor
       
    }
}




extension SeatBookingVC {
   
    func updateLabels() {
        var selectedSeats = [Seat]()
        var totalPrice = 0

        // Find the selected seats and calculate the total price
        for sectionSeats in seatsData {
            for seat in sectionSeats {
                if seat.isSelected {
                    selectedSeats.append(seat)
                    totalPrice += perTicketPrice
                }
            }
        }

        // Update the seat label text
        if selectedSeats.isEmpty {
            seatLabel.text = "No Seat Selected"
        } else {
            let selectedSeatNumbers = selectedSeats.map { $0.row + $0.seatNumber }
            seatLabel.text = selectedSeatNumbers.joined(separator: ", ")
            seatLabel.text =  seatLabel.text! + " Selected"
        }

        // Update the price label text
        let priceString = String(format: "$%.2f", Float(totalPrice) )
        self.totalPrice.text = priceString
    }

    
    @IBAction func onContinue(_ sender: Any) {
        
        if(countSelectedSeats() == 0) {
            showAlertAnyWhere(message: "Please select seat")
            return
        }
        
        DataShareHelper.shared.selectedSeats = seatLabel.text!.replacingOccurrences(of: " Selected", with: "")
        DataShareHelper.shared.totalCoast = self.totalPrice.text!
       
        self.pushVC(viewConterlerId: "PaymentVC")

    }
    
}
