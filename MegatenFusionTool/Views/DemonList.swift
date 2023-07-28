//
//  DemonList.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct DemonList: View {
    
    @State var demon_list = Array<Demon>()
    @State var scrollViewID = UUID()
    
    init() {
        demon_list = compendium.demon_data.sorted {
            $0.lvl < $1.lvl
        }
        scrollViewID = UUID()
    }

    var body: some View {
        VStack {
            NavigationView {

                List($demon_list, id:\.name) { $demon in
                    NavigationLink {
                        DemonDetail(demon: $demon)
                    } label: {
                        DemonRow(demon: $demon)
                    }
                    .navigationTitle("Demons")
                    
                }
                
            }.onAppear {
                demon_list = compendium.demon_data.sorted {
                    $0.lvl < $1.lvl
                }
                print("Demon List Updated")
                //scrollViewID = UUID()
            }.id(self.scrollViewID)
        }
    }
}



struct DemonList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            DemonList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
