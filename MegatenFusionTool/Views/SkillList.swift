//
//  DemonList.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct SkillList: View {
    let demon: Demon?

    
    var body: some View {
        var skill_list: Array<Skill> {
            if demon != nil {
                return compendium.skill_data.filter { demon!.skills.contains($0) }
            } else {
                return compendium.skill_data
            }
        }
        
        NavigationView {
            List(skill_list.sorted {
                $0.elem > $1.elem
            }, id:\.description) { skill in
                NavigationLink {
                    SkillDetail(skill: skill)
                } label: {
                    SkillRow(skill: skill)
                }
                .navigationTitle("Skills")
                
            }
        }
    }
}

struct SkillList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            SkillList(demon: nil)
                .previewDevice(PreviewDevice(rawValue: deviceName))
        }
    }
}
