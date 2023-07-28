//
//  Settings.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Game Selection").font(.title)
            Button("Strange Journey") {
                compendium.current_game = .smtsj
                compendium.Update()
            }
            Button("SMT IV") {
                compendium.current_game = .smt4
                compendium.Update()
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
