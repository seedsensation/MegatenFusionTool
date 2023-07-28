//
//  MainView.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            DemonList()
                .tabItem {
                    Label("Demons", systemImage: "list.dash")
                }
            SkillList(demon: nil)
                .tabItem {
                    Label("Skills", systemImage: "star.fill")
                }
            Settings()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
