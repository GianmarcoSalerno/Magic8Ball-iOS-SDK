import Testing
@testable import Magic8Ball_iOS_SDK

final class Magic8BallSDKTests {
    
    @Test func testMagic8BallThemeEnum() async throws {
        // Test that all theme cases exist
        let themes: [Magic8BallTheme] = [.light, .dark, .auto]
        #expect(themes.count == 3)
    }
    
    @Test func testURLStringIsValid() async throws {
        // Test that the URL string is valid
        let urlString = "https://xvehl58kcb.appflowapp.com/chat"
        let url = URL(string: urlString)
        #expect(url != nil)
    }
}
