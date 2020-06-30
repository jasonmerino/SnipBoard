//
//  ContentView.swift
//  SnipBoard
//
//  Created by Jason Merino on 6/26/20.
//  Copyright © 2020 Jason Merino. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    var body: some View {
        TextField("Enter text", text: $name)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
