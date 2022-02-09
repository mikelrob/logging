import Quick
import Nimble
@testable import LoggingKit

final class LoggingTests: QuickSpec {

    override func spec() {
        var subject: Logging!

        describe("#filename") {
            beforeEach {
                subject = MockLogger()
            }

            it("should confirm the call site") {
                expect(subject.filename(from: #file)).to(equal("LoggingTests"))
            }

            it("should return input when unable to parse the filename") {
                expect(subject.filename(from: "not\\a\\file\\path")).to(equal("not\\a\\file\\path"))
            }
        }

        describe("#consolidateAttributes") {

            beforeEach {
                subject = MockLogger()
            }

            var attributes: [String: Codable]?

            context("when attributes are nil") {

                beforeEach {
                    attributes = nil
                }

                it("should be correct") {
                    let attrs = subject.consolidateAttributes(attributes: attributes, file: #file, function: #function, line: #line)
                    expect(attrs["file"] as? String).to(equal("LoggingTests"))
                    expect(attrs["function"] as? String).to(equal("spec()"))
                    expect(attrs["line"] as? Int).to(equal(39))
                }
            }
        }
    }
}
