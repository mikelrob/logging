import Foundation

public final class ConsoleLogger: Logging {

    public static let instance = ConsoleLogger()

    public private(set) var identifier: String = "ConsoleLogging"

    public func debug(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .debug, file: file, function: function, line: line))
    }

    public func info(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .info, file: file, function: function, line: line))
    }

    public func notice(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .notice, file: file, function: function, line: line))
    }

    public func warn(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .warn, file: file, function: function, line: line))
    }

    public func error(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .error, file: file, function: function, line: line), to: .standardError)
    }

    public func critical(_ logEntry: Loggable, file: String, function: String, line: Int) {
        log(stringify(logEntry: logEntry, logLevel: .critical, file: file, function: function, line: line), to: .standardError)
    }

    private func stringify(logEntry: Loggable, logLevel: LogLevel, file: String, function: String, line: Int) -> String {
        let filename = self.filename(from: file)
        return "\(Date()) Logger \(logLevel) \(filename).\(function):\(line) - \(logEntry)\n"
    }

    private func log(_ string: String, to consoleDescriptor: FileHandle = FileHandle.standardOutput) {
        consoleDescriptor.write(Data(string.utf8))
    }
}
