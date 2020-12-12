## Simple NSDiscardableContent test in response to a question someone posted.

Global data object `TestDataObject` that conforms to `NSDiscardableContent` 
(in a non-multi-threaded implementation) and a handler in `AppDelegate` 
that responds to memory warnings by calling `discardIfPossible()` on the
global data object.

SwiftUI window with some buttons to exercise the data object's NSDiscardable 
protocol implementation.

If you comment out the call to `discardIfPossible()` in `AppDelegate` then
you can see that it's not called automatically.


