//
//  ContentView.swift
//  TestDiscardable
//
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
		
		Button("print") {
			globalData.printArray()
		}
		Button("Mark unused") {
			globalData.endContentAccess()
		}
		Button("Mark used") {
			if !globalData.beginContentAccess() {
				print("purged!")
			}
		}
		Button("reallocate") {
			globalData.reallocate(["Reallocated", "values"])
		}
		Button("debug") {
			globalData.debug()
		}
		Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
