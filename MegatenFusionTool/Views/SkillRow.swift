//
//  SkillRow.swift
//  MegatenFusionTool
//
//  Created by Mercury Evans on 28/07/2023.
//

import SwiftUI

struct SkillRow: View {
    var skill: Skill
    var body: some View {
        Text("\(skill.name) (\(skill.elem))")
    }
}

struct SkillRow_Previews: PreviewProvider {
    static var previews: some View {
        SkillRow(skill: compendium.skill_data[0])
    }
}
