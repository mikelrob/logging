import LoggingKit

final class MockLogger: Logging {

    private(set) var lastDebug: Loggable?
    private(set) var lastInfo: Loggable?
    private(set) var lastNotice: Loggable?
    private(set) var lastWarn: Loggable?
    private(set) var lastError: Loggable?
    private(set) var lastCritical: Loggable?

    private(set) var identifier: String = ""

    func debug(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastDebug = logEntry
    }

    func info(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastInfo = logEntry
    }

    func notice(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastNotice = logEntry
    }

    func warn(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastWarn = logEntry
    }

    func error(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastError = logEntry
    }

    func critical(_ logEntry: Loggable, file: String, function: String, line: Int) {
        lastCritical = logEntry
    }

    func setIdentifier(_ id: String) {
        identifier = id
    }
}

