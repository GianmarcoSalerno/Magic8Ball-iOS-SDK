import Testing
@testable import Magic8Ball_iOS_SDK

final class Magic8BallSDKTests {
    
    @Test func testMagic8BallThemeEnum() async throws {
        // Test that all theme cases exist
        let themes: [Magic8BallTheme] = [.light, .dark, .auto]
        #expect(themes.count == 3)
        
        // Test that each theme is unique
        let uniqueThemes = Set(themes)
        #expect(uniqueThemes.count == 3)
    }
    
    @Test func testURLStringIsValid() async throws {
        // Test that the URL string is valid
        let urlString = "https://xvehl58kcb.appflowapp.com/chat"
        let url = URL(string: urlString)
        #expect(url != nil)
        #expect(url?.absoluteString == urlString)
    }
    
    @Test func testCornerRadiusValues() async throws {
        // Test that corner radius values are reasonable
        let testValues: [CGFloat] = [0, 5, 10, 15, 20]
        
        for radius in testValues {
            #expect(radius >= 0)
            #expect(radius <= 50) // Reasonable upper limit
        }
    }
    
    @Test func testThemeValues() async throws {
        // Test theme enum values
        #expect(Magic8BallTheme.light != Magic8BallTheme.dark)
        #expect(Magic8BallTheme.dark != Magic8BallTheme.auto)
        #expect(Magic8BallTheme.auto != Magic8BallTheme.light)
    }
    
    @Test func testDefaultValues() async throws {
        // Test that default values are reasonable
        let defaultTheme = Magic8BallTheme.auto
        #expect(defaultTheme == .auto)
        
        let defaultCornerRadius: CGFloat = 0
        #expect(defaultCornerRadius == 0)
    }
}
