//
//  DenemeCollectionViewCell.swift
//  MoviesApp
//
//  Created by Ecem Öztürk on 13.07.2023.
//

import UIKit

class DenemeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DenemeCollectionViewCell"
        
        private let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
    
    override init(frame: CGRect) { //init(frame: CGRect) metodu, hücrenin başlangıç çerçevesini alır. Bu metot, hücre oluşturulduğunda çalışır ve içerik görüntüsüne (contentView) imageView'i ekler.
        super.init(frame: frame)
           contentView.addSubview(imageView)

        
        let images: [UIImage] = [
            UIImage(named: "movie1"),
            UIImage(named: "movie2"),
            UIImage(named: "movie3"),
            UIImage(named: "movie4"),
            UIImage(named: "movie1"),
            UIImage(named: "movie2"),
            UIImage(named: "movie3"),
        ].compactMap({ $0 }) //compactMap yöntemi kullanılarak diziden nil olmayan görüntüler temizlenir.
        imageView.image = images.randomElement() //imageView.image özelliğine, images dizisinden rastgele bir öğe atanır. Bu, hücrenin her oluşturulduğunda farklı bir görüntü göstermesini sağlar.
        contentView.clipsToBounds = true //contentView.clipsToBounds özelliği true olarak ayarlanarak, içerik görüntüsünün sınırlarını aşan görüntülerin kırpılmasını sağlar.
        
    }
    
    required init(coder: NSCoder) { //required init(coder: NSCoder) metodu, arayüz dosyaları veya hücrenin yapılandırılması sırasında çağrılır. Bu metotu özel bir uygulama gerektirmediğinden, fatalError() ile uygulama hemen sonlandırılır.
        fatalError()
    }
    
    override func layoutSubviews() { //layoutSubviews metodu, hücrenin alt görünümlerinin yerleşimini yeniden düzenler. Bu durumda, imageView'in çerçevesini içerik görünümünün sınırlarına ayarlar.
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}

