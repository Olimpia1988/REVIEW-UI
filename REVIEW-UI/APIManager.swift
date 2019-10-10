import Foundation

final class APIManager {
    private init() {}
    static let manager = APIManager()
    
    func getData(completionHandler: @escaping(Result<[MoreData], AppError>) -> ()) {
        
        let urlString = "https://api.edamam.com/search?q=chicke&app_id=\(Constants.id)&app_key=\(Constants.key)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.badURL))
            return
        }
        
        NetworkHelper.manager.performDataTask(withURL: url, andMethod: .get) { (result) in
            switch result {
            case .failure(let error):
                completionHandler(.failure(error))
            case .success(let data):
                let recepiesData = DetailedData.gerRecepies(from: data)
                completionHandler(.success(recepiesData))
            }
        }
        
        
        
    }
}
