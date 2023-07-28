//
//  DemonDetail.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct DemonDetail: View {
    var demon: Binding<Demon>
    
    init(demon: Binding<Demon>) {
        self.demon = demon
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                Text("\(demon.wrappedValue.name)")
                    .font(.title)
                
                HStack {
                    Text("\(demon.wrappedValue.race)")
                    Spacer()
                    Text("Level \(demon.wrappedValue.lvl)")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
            }.padding()
            VStack (alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("About This Demon")
                            .font(.title2)
                        if demon.wrappedValue.align != nil {
                            Text("Alignment: \(demon.wrappedValue.align!)")
                        }
                        
                        Spacer()
                        HStack(alignment: .center) {
                            VStack {
                                Spacer()
                                Text("Stat Line").font(.subheadline)
                                //StatsTable(demon: demon)
                                Spacer()
                            }
                        }
                    }
                }
                //SkillList(demon: demon)
            }.padding()
        }
    }
}

struct DemonDetail_Previews: PreviewProvider {
    static var previews: some View {
        @State var selected_demon = compendium.demon_data[0]
        var x = $selected_demon
        DemonDetail(demon: x)
    }
}
