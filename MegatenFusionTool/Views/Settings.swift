//
//  Settings.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct Settings: View {
    @State private var showingAlert: Bool = false

    var body: some View {
        

        VStack(alignment: .center) {
            NavigationStack {
                            
                List {
                    Section {
                        NavigationLink {
                            GameSelection()
                        } label: {
                            Text("Select a Game")
                        }.navigationTitle("Settings")
                            .navigationBarTitleDisplayMode(.inline)
                        
                        Button("Refresh Compendium Data") {
                            compendium.Update()
                            showingAlert = true
                        }.alert("The compendium has successfully been updated.",isPresented: $showingAlert) {
                            Button("OK",role:.cancel) {}
                        }
                    } header: {
                        Text("Compendium Settings")
                    }
                    Section {
                        NavigationLink {
                            Legal()
                        } label: {
                            Text("Legal")
                        }
                    }
                    
                }
                
            }
            
            
            
        }
    }
}

struct Legal: View {
    var body: some View{
        VStack(alignment: .center) {
            Spacer()
            ScrollView {
                Text("""
        
        The source code for this application can be found [here](https://google.com).
        
        
        BSD 3-Clause License
        
        Copyright (c) 2023, Mercury Evans
        All rights reserved.
        
        Redistribution and use in source and binary forms, with or without
        modification, are permitted provided that the following conditions are met:
        
        1. Redistributions of source code must retain the above copyright notice, this
           list of conditions and the following disclaimer.
        
        2. Redistributions in binary form must reproduce the above copyright notice,
           this list of conditions and the following disclaimer in the documentation
           and/or other materials provided with the distribution.
        
        3. Neither the name of the copyright holder nor the names of its
           contributors may be used to endorse or promote products derived from
           this software without specific prior written permission.
        
        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
        AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
        IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
        DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
        FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
        DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
        SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
        CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
        OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
        OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
        
        """).multilineTextAlignment(.center).foregroundStyle(.secondary)
            }
        }
    }
}


struct GameSelection: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Game Selection Menu")
        }
    }
}

struct Settings_Mainline: View {
    var body: some View {
        VStack(alignment:.center) {
            Text("Hello")
        }
    }
}





struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().previewDisplayName("Settings Page")
        GameSelection().previewDisplayName("Game Selection Menu")
        Settings_Mainline().previewDisplayName("Mainline SMT")
    }
}
