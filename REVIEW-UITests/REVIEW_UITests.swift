import XCTest
@testable import REVIEW_UI

class REVIEW_UITests: XCTestCase {

    func testGetRecepies() {
        //Arrange
        let recepiesData = getSampleData()
        
        //Act
        let recepies = DetailedData.gerRecepies(from: recepiesData)
        
        //Assert
        XCTAssert(recepies.count != 0)
        
        
    }
    
   
    
    
    func getSampleData() -> Data {
        guard let pathData = Bundle.main.path(forResource: "recepieTest", ofType: "json") else {
            fatalError("Jason not found")
        }
        
        let internalURL = URL(fileURLWithPath: pathData)
        
        do {
            let data = try Data(contentsOf: internalURL)
            return data
            
        } catch {
            fatalError("An error has occured: \(error)")
        }
    }
    
    
}
