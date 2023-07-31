import UIKit
import ImageIO

@IBDesignable
class GIFImageView: UIImageView {
    
    @IBInspectable var gifImage: String?
    
    private var gifURL: URL?
    private var gifSource: CGImageSource?
    private var gifFrames = [UIImage]()
    private var gifProperties = [String: Any]()
    private var currentFrame = 0
    private var gifFrameTime = 0.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        loadGif()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        loadGif()
    }
    
    private func loadGif() {
        guard let gifImage = gifImage, let path = Bundle.main.path(forResource: gifImage, ofType: "gif") else {
            print("Failed to load GIF in")
            return
        }
        
        gifURL = URL(fileURLWithPath: path)
        guard let url = gifURL, let source = CGImageSourceCreateWithURL(url as CFURL, nil) else {
            print("Failed to create image source")
            return
        }
        
        gifSource = source
        let frameCount = CGImageSourceGetCount(source)
        for i in 0..<frameCount {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                gifFrames.append(UIImage(cgImage: cgImage))
            }
        }
        
        let properties = CGImageSourceCopyProperties(source, nil)
        gifProperties = (properties as? [String: Any]) ?? [:]
        gifFrameTime = durationForFrame(at: currentFrame)
        
        startAnimatingGif()
    }
    
    private func durationForFrame(at index: Int) -> Double {
        guard let source = gifSource else { return 0 }
        
        let frameProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
        let gifProperties = (frameProperties as? [String: Any]) ?? self.gifProperties
        
        var delayTime = gifProperties[kCGImagePropertyGIFDelayTime as String] as? Double ?? 0
        if delayTime < 0.1 {
            delayTime = 0.1
        }
        
        return delayTime
    }
    
    private func startAnimatingGif() {
        guard !gifFrames.isEmpty else { return }
        
        let nextFrame = (currentFrame + 1) % gifFrames.count
        let frameTime = durationForFrame(at: nextFrame)
        
        perform(#selector(updateGifFrame), with: nil, afterDelay: frameTime)
    }
    
    @objc private func updateGifFrame() {
        guard !gifFrames.isEmpty else { return }
        
        image = gifFrames[currentFrame]
        currentFrame = (currentFrame + 1) % gifFrames.count
        
        startAnimatingGif()
    }
    
    override func stopAnimating() {
        super.stopAnimating()
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(updateGifFrame), object: nil)
    }
}
