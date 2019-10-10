import Foundation
import UIKit

class ImageHelper {
   
    private init() {}
    static let shared = ImageHelper()
    
    //MARK: - Internal Methods
    func getImage(urlString: String, completionHandler: @escaping(Result<UIImage, AppError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.noDataReceived))
                return
            }
            
            guard let image = UIImage(data: data) else {
                completionHandler(.failure(.notAnImage))
                return
            }
            
            completionHandler(.success(image))
            
        }.resume()
    }
}
