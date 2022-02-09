import LoggingKit
import Quick
import Nimble

final class LogEntryTests: QuickSpec {

    override func spec() {

        describe("#init") {
            var subject: LogEntry?

            context("when calling the initialiser with only a string to ensure it is public") {

                beforeEach {
                    subject = LogEntry(message: "just a test")
                }

                it("should be public and create a new instance") {
                    expect(subject).toNot(be(nil))
                    expect(subject?.message).to(equal("just a test"))
                }
            }

            context("when calling the initialiser with all members to ensure it is public") {

                beforeEach {
                    subject = LogEntry(message: "just a test", error: MockError.testError, attributes: ["Key" : 83])
                }

                it("should be public and create a new instance") {
                    expect(subject).toNot(be(nil))
                    expect(subject?.message).to(equal("just a test"))
                    expect(subject?.error as? MockError).to(equal(MockError.testError))
                    if let value = subject?.attributes?["Key"] as? Int {
                        expect(value).to(equal(83))
                    } else {
                        fail()
                    }
                }
            }
        }
    }
}
