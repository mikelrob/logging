import Quick
import Nimble
import Foundation
import LoggingKit

//class MockPipe: Pipe {
//
//    override var fileHandleForReading: FileHandle {
//        FileHandle(fileDescriptor: 900876578)
//    }
//
//    func write(_ data: Data) {
//        print("got data")
//        var gg = 2 + 2
//    }
//}

final class ConsoleLoggerTests: QuickSpec {

    override func spec() {
//        var count = 0
//        var lastOutput: String!
//
//        FileHandle.standardOutput.readabilityHandler = { fileHandle in
//            count += 1
//            lastOutput = String(data: fileHandle.availableData, encoding: .utf8)
//        }

//            = Pipe()
//        stdOutPipe
        //FileHandle.standardOutput.fileDescriptor
//        let result = dup2(stdOutPipe.fileHandleForReading.fileDescriptor, STDOUT_FILENO)

//        stdOutPipe.fileHandleForReading.readabilityHandler = { fileHandle in
//            count += 1
//            lastOutput = String(data: fileHandle.availableData, encoding: .utf8)
//        }

//        let stdErrPipe = Pipe()
//        dup2(FileHandle.standardError.fileDescriptor, stdErrPipe.fileHandleForReading.fileDescriptor)
//
//        var subject: ConsoleLogger!

//        FileHandle.standardOutput.readabilityHandler = { fileHandle in
//            lastOutput = String(data: fileHandle.availableData, encoding: .utf8)
//        }

//        beforeEach {
//            subject = ConsoleLogger.instance
//        }


//        describe("#identifier") {
//
//            context("when calling debug") {
//                beforeEach {
//                    subject.debug("test string", file: #file, function: #function, line: #line)
//                }
//
//                it("should write") {
//                    expect(lastOutput).toEventually(endWith("Log 🟢 [ DEBUG ]  ConsoleLoggerTests.spec():19 - test string"))
//                }
//            }
//        }
    }

//    func handlePipeNotification(notification: Notification) {
//        //note you have to continuously call this when you get a message
//        //see this from documentation:
//        //Note that this method does not cause a continuous stream of notifications to be sent. If you wish to keep getting notified, you’ll also need to call readInBackgroundAndNotify() in your observer method.
//        inputPipe?.fileHandleForReading.readInBackgroundAndNotify()
//
//        if let data = notification.userInfo[NSFileHandleNotificationDataItem] as? Data,
//           let str = String(data: data, encoding: String.Encoding.ascii) {
//
//            //write the data back into the output pipe. the output pipe's write file descriptor points to STDOUT. this allows the logs to show up on the xcode console
//            outputPipe?.fileHandleForWriting.write(data)
//
//            // `str` here is the log/contents of the print statement
//            //if you would like to route your print statements to the UI: make
//            //sure to subscribe to this notification in your VC and update the UITextView.
//            //Or if you wanted to send your print statements to the server, then
//            //you could do this in your notification handler in the app delegate.
//        }
//    }

//    func openConsolePipe() {
//        //open a new Pipe to consume the messages on STDOUT and STDERR
//        inputPipe = Pipe()
//
//        //open another Pipe to output messages back to STDOUT
//        outputPipe = Pipe()
//
//        guard let inputPipe = inputPipe, let outputPipe = outputPipe else {
//            return
//        }
//
//        let pipeReadHandle = inputPipe.fileHandleForReading
//
//        //from documentation
//        //dup2() makes newfd (new file descriptor) be the copy of oldfd (old file descriptor), closing newfd first if necessary.
//
//        //here we are copying the STDOUT file descriptor into our output pipe's file descriptor
//        //this is so we can write the strings back to STDOUT, so it can show up on the xcode console
//        dup2(STDOUT_FILENO, outputPipe.fileHandleForWriting.fileDescriptor)
//
//        //In this case, the newFileDescriptor is the pipe's file descriptor and the old file descriptor is STDOUT_FILENO and STDERR_FILENO
//
//        dup2(inputPipe.fileHandleForWriting.fileDescriptor, STDOUT_FILENO)
//        dup2(inputPipe.fileHandleForWriting.fileDescriptor, STDERR_FILENO)
//
//        //listen in to the readHandle notification
//        NotificationCenter.default.addObserver(self, selector: #selector(self.handlePipeNotification), name: FileHandle.readCompletionNotification, object: pipeReadHandle)
//
//        //state that you want to be notified of any data coming across the pipe
//        pipeReadHandle.readInBackgroundAndNotify()
//    }

}
