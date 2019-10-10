
import Foundation

struct Recepies: Codable {
    var hits: [MoreData]
}

struct MoreData: Codable {
    var recipe: DetailedData
}

struct DetailedData: Codable {
    var label: String
    var image: String
    var source: String
    var ingredientLines: [String]
    var calories: Double
    
    static func gerRecepies(from jasonData: Data) -> [MoreData] {
        do {
            let recepieWraper = try JSONDecoder().decode(Recepies.self, from: jasonData)
            return recepieWraper.hits
        } catch {
            dump(error)
            return []
        }
    }
}
