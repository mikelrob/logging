import LoggingKit
import Quick
import Nimble

final class LogTests: QuickSpec {

    override func spec() {
        describe("#behaviour") {
            var mockLogger: MockLogger!
            var logger: Logging!

            context("when a logger is registered") {
                beforeEach {
                    mockLogger = MockLogger()
                    logger = mockLogger
                    Log.register(logger: logger)
                }

                context("and debug is called") {
                    let testLogEntry = LogEntry(message: "debug test string", error: nil, attributes: nil)

                    beforeEach {
                        Log.debug(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastDebug?.message).toEventually(equal("debug test string"))
                    }
                }

                context("and info is called") {
                    let testLogEntry = LogEntry(message: "info test string", error: nil, attributes: nil)

                    beforeEach {
                        Log.info(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastInfo?.message).toEventually(equal("info test string"))
                    }
                }

                context("and notice is called") {
                    let testLogEntry = LogEntry(message: "notice test string", error: nil, attributes: nil)

                    beforeEach {
                        Log.notice(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastNotice?.message).toEventually(equal("notice test string"))
                    }
                }

                context("and warn is called") {
                    let testLogEntry = LogEntry(message: "warn test string", error: nil, attributes: nil)

                    beforeEach {
                        Log.warn(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastWarn?.message).toEventually(equal("warn test string"))
                    }
                }

                context("and error is called with a LogEntry") {
                    let testLogEntry = LogEntry(message: "error test string", error: MockError.testError, attributes: nil)

                    beforeEach {
                        Log.error(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastError?.message).toEventually(equal("error test string"))
                        expect(mockLogger.lastError?.error as? MockError).toEventually(equal(MockError.testError))
                    }
                }

                context("and error is called with an Error") {
                    let testError = MockError.testError

                    beforeEach {
                        Log.error(testError)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastError?.message).toEventually(equal("testError"))
                        expect(mockLogger.lastError?.error as? MockError).toEventually(equal(MockError.testError))
                    }
                }

                context("and critical is called") {
                    let testLogEntry = LogEntry(message: "critical test string", error: MockError.criticalError, attributes: nil)

                    beforeEach {
                        Log.critical(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastCritical?.message).toEventually(equal("critical test string"))
                        expect(mockLogger.lastCritical?.error as? MockError).toEventually(equal(MockError.criticalError))
                    }
                }

                context("and then the logger is unregistered by instance") {
                    beforeEach {
                        Log.unregister(logger: logger)
                    }

                    context("and debug is called") {
                        let testLogEntry = LogEntry(message: "debug test string", error: nil, attributes: nil)

                        beforeEach {
                            Log.debug(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastDebug?.message).toEventually(beNil())
                        }
                    }

                    context("and info is called") {
                        let testLogEntry = LogEntry(message: "info test string", error: nil, attributes: nil)

                        beforeEach {
                            Log.info(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastInfo?.message).toEventually(beNil())
                        }
                    }

                    context("and notice is called") {
                        let testLogEntry = LogEntry(message: "notice test string", error: nil, attributes: nil)

                        beforeEach {
                            Log.notice(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastNotice?.message).toEventually(beNil())
                        }
                    }

                    context("and warn is called") {
                        let testLogEntry = LogEntry(message: "warn test string", error: nil, attributes: nil)

                        beforeEach {
                            Log.warn(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastWarn?.message).toEventually(beNil())
                        }
                    }

                    context("and error is called with a LogEntry") {
                        let testLogEntry = LogEntry(message: "error test string", error: MockError.testError, attributes: nil)

                        beforeEach {
                            Log.error(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastError?.message).toEventually(beNil())
                            expect(mockLogger.lastError?.error as? MockError).toEventually(beNil())
                        }
                    }

                    context("and error is called with an error") {
                        let testError = MockError.testError

                        beforeEach {
                            Log.error(testError)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastError?.message).toEventually(beNil())
                            expect(mockLogger.lastError?.error as? MockError).toEventually(beNil())
                        }
                    }

                    context("and critical is called") {
                        let testLogEntry = LogEntry(message: "critical test string", error: MockError.criticalError, attributes: nil)

                        beforeEach {
                            Log.critical(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastCritical?.message).toEventually(beNil())
                            expect(mockLogger.lastCritical?.error as? MockError).toEventually(beNil())
                        }
                    }
                }
            }

            context("when a logger is registered") {
                beforeEach {
                    mockLogger = MockLogger()
                    logger = mockLogger
                    Log.register(logger: logger)
                }

                context("and debug is called") {
                    let testLogEntry = LogEntry(message: "debug test string", error: nil, attributes: nil)

                    beforeEach {
                        Log.debug(testLogEntry)
                    }

                    it("should pass the log entry to the logger") {
                        expect(mockLogger.lastDebug?.message).toEventually(equal("debug test string"))
                    }
                }

                context("and then the logger is unregistered by identifier") {
                    beforeEach {
                        Log.unregister(named: logger.identifier)
                    }

                    context("and debug is called") {
                        let testLogEntry = LogEntry(message: "debug test string", error: nil, attributes: nil)

                        beforeEach {
                            Log.debug(testLogEntry)
                        }

                        it("should not pass the log entry to the logger") {
                            expect(mockLogger.lastDebug?.message).toEventually(beNil())
                        }
                    }
                }
            }
        }
    }
}
