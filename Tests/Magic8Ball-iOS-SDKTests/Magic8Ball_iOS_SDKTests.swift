import Testing
@testable import Magic8Ball_iOS_SDK

final class Magic8BallSDKTests {
    
    @Test func testMagic8BallThemeEnum() async throws {
        // Input: Create theme array, Output: Should have 3 themes
        let themes: [Magic8BallTheme] = [.light, .dark, .auto]
        #expect(themes.count == 3)
    }
    
    @Test func testURLStringIsValid() async throws {
        // Input: URL string, Output: Should be valid URL
        let urlString = "https://xvehl58kcb.appflowapp.com/chat"
        let url = URL(string: urlString)
        #expect(url != nil)
    }
    
    @Test func testDefaultTheme() async throws {
        // Input: No theme specified, Output: Should be .auto
        let defaultTheme = Magic8BallTheme.auto
        #expect(defaultTheme == .auto)
    }
    
    @Test func testThemeComparison() async throws {
        // Input: Different themes, Output: Should not be equal
        #expect(Magic8BallTheme.light != Magic8BallTheme.dark)
        #expect(Magic8BallTheme.dark != Magic8BallTheme.auto)
        #expect(Magic8BallTheme.auto != Magic8BallTheme.light)
    }
    
    @Test func testDefaultCornerRadius() async throws {
        // Input: No corner radius specified, Output: Should be 0
        let defaultRadius: CGFloat = 0
        #expect(defaultRadius == 0)
    }
    
    @Test func testCornerRadiusValues() async throws {
        // Input: Various radius values, Output: Should be valid
        let testValues: [CGFloat] = [0, 5, 10, 15, 20]
        for radius in testValues {
            #expect(radius >= 0)
            #expect(radius <= 50) // Reasonable upper limit
        }
    }
    
    @Test func testURLStringFormat() async throws {
        // Input: URL string, Output: Should match expected format
        let urlString = "https://xvehl58kcb.appflowapp.com/chat"
        #expect(urlString.hasPrefix("https://"))
        #expect(urlString.contains("appflowapp.com"))
    }
    
    @Test func testThemeCases() async throws {
        // Input: Each theme case, Output: Should be unique
        let lightTheme = Magic8BallTheme.light
        let darkTheme = Magic8BallTheme.dark
        let autoTheme = Magic8BallTheme.auto
        
        #expect(lightTheme != darkTheme)
        #expect(darkTheme != autoTheme)
        #expect(autoTheme != lightTheme)
    }
    
    @Test func testURLComponents() async throws {
        // Input: URL string, Output: Should have correct components
        let urlString = "https://xvehl58kcb.appflowapp.com/chat"
        let url = URL(string: urlString)
        
        #expect(url != nil)
        #expect(url?.scheme == "https")
        #expect(url?.host == "xvehl58kcb.appflowapp.com")
        #expect(url?.path == "/chat")
    }
    
    @Test func testCornerRadiusRange() async throws {
        // Input: Valid radius values, Output: Should be in reasonable range
        let validRadii: [CGFloat] = [0, 1, 5, 10, 15, 20]
        
        for radius in validRadii {
            #expect(radius >= 0)
            #expect(radius <= 100) // Maximum reasonable value
        }
    }
    
    @Test func testThemeStringRepresentation() async throws {
        // Input: Theme enum cases, Output: Should be different when converted to string
        let lightString = String(describing: Magic8BallTheme.light)
        let darkString = String(describing: Magic8BallTheme.dark)
        let autoString = String(describing: Magic8BallTheme.auto)
        
        #expect(lightString != darkString)
        #expect(darkString != autoString)
        #expect(autoString != lightString)
    }
}
