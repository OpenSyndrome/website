graph [
  directed 1
  node [
    id 0
    label "Measured fever"
    type "symptom"
    name "Measured fever"
    attribute "body_temperature"
    operator ">="
    value 38
    unit "degrees Celsius"
  ]
  node [
    id 1
    label "Cough"
    type "symptom"
    name "Cough"
  ]
  node [
    id 2
    label "Onset within the last 10 days"
    type "symptom"
    name "Onset within the last 10 days"
  ]
  node [
    id 3
    label "Influenza-Like Illness (ILI) Africa CDC"
  ]
  node [
    id 4
    label "Fever"
    type "symptom"
    name "Fever"
    description "Greater than 38 degrees Celsius"
    attribute "body_temperature"
    operator ">="
    value 37.7
    unit "celsius"
  ]
  node [
    id 5
    label "Sore throat"
    type "symptom"
    name "Sore throat"
  ]
  node [
    id 6
    label "Influenza-like Illness (ILI)"
  ]
  node [
    id 7
    label "Other specific diagnosis"
    type "diagnosis"
    name "Other specific diagnosis"
    description "Presence of any other specific diagnosis that explains the symptoms"
  ]
  node [
    id 8
    label "bile-stained vomiting"
    type "symptom"
    name "bile-stained vomiting"
  ]
  node [
    id 9
    label "examination findings of acute abdominal distension and abnormal or absent bowel sounds"
    type "symptom"
    name "examination findings of acute abdominal distension and abnormal or absent bowel sounds"
  ]
  node [
    id 10
    label "fluid levels and dilated bowel loops on plain abdominal radiograph"
    type "symptom"
    name "fluid levels and dilated bowel loops on plain abdominal radiograph"
  ]
  node [
    id 11
    label "Acute Intussusception in infants"
  ]
  node [
    id 12
    label "Rash"
    type "symptom"
    name "Rash"
    description "maculopapular morbilliform cephalocaudal"
  ]
  node [
    id 13
    label "Conjunctivitis (non-purulent/hyperemic)"
    type "symptom"
    name "Conjunctivitis (non-purulent/hyperemic)"
  ]
  node [
    id 14
    label "Arthralgia"
    type "symptom"
    name "Arthralgia"
  ]
  node [
    id 15
    label "Myalgia"
    type "symptom"
    name "Myalgia"
  ]
  node [
    id 16
    label "Peri-articular edema"
    type "symptom"
    name "Peri-articular edema"
  ]
  node [
    id 17
    label "Zika"
  ]
  node [
    id 18
    label "Signs, symptoms and/or radiological findings consistent with active tuberculosis in any site"
    type "symptom"
    name "Signs, symptoms and/or radiological findings consistent with active tuberculosis in any site"
  ]
  node [
    id 19
    label "A clinician's decision to treat the person with a full course of anti-tuberculosis therapy"
    type "professional_judgment"
    name "A clinician's decision to treat the person with a full course of anti-tuberculosis therapy"
  ]
  node [
    id 20
    label "A case discovered post-mortem with pathological findings consistent with active tuberculosis that would have indicated anti-tuberculosis antibiotic treatment had the patient been diagnosed before dying"
    type "professional_judgment"
    name "A case discovered post-mortem with pathological findings consistent with active tuberculosis that would have indicated anti-tuberculosis antibiotic treatment had the patient been diagnosed before dying"
  ]
  node [
    id 21
    label "Tuberculosis"
  ]
  node [
    id 22
    label "Acute unexplained rash"
    type "symptom"
    name "Acute unexplained rash"
    attribute "onset_date"
    operator "<"
    value "2022-03-15"
  ]
  node [
    id 23
    label "Headache"
    type "symptom"
    name "Headache"
  ]
  node [
    id 24
    label "Sudden onset fever"
    type "symptom"
    name "Sudden onset fever"
    description "Sudden onset fever (>38.5&#176;C)"
  ]
  node [
    id 25
    label "Muscle pain"
    type "symptom"
    name "Muscle pain"
  ]
  node [
    id 26
    label "Back pain"
    type "symptom"
    name "Back pain"
  ]
  node [
    id 27
    label "Fatigue"
    type "symptom"
    name "Fatigue"
  ]
  node [
    id 28
    label "Lymphadenopathy"
    type "symptom"
    name "Lymphadenopathy"
  ]
  node [
    id 29
    label "Smallpox"
  ]
  node [
    id 30
    label "Chickenpox"
    type "diagnosis"
    name "Chickenpox"
  ]
  node [
    id 31
    label "Shingles"
    type "diagnosis"
    name "Shingles"
  ]
  node [
    id 32
    label "Measles"
    type "diagnosis"
    name "Measles"
  ]
  node [
    id 33
    label "Rubella"
    type "diagnosis"
    name "Rubella"
  ]
  node [
    id 34
    label "Zika virus"
    type "diagnosis"
    name "Zika virus"
  ]
  node [
    id 35
    label "Dengue fever"
    type "diagnosis"
    name "Dengue fever"
    description "Dengue fever (A90) or Dengue hemorrhagic fever (A91)"
    code [
      system "ICD-10"
      code "A90"
    ]
  ]
  node [
    id 36
    label "Chikungunya virus"
    type "diagnosis"
    name "Chikungunya virus"
  ]
  node [
    id 37
    label "Common cold herpes"
    type "diagnosis"
    name "Common cold herpes"
  ]
  node [
    id 38
    label "Bacterial skin infections"
    type "diagnosis"
    name "Bacterial skin infections"
  ]
  node [
    id 39
    label "Disseminated gonococcal infection"
    type "diagnosis"
    name "Disseminated gonococcal infection"
  ]
  node [
    id 40
    label "Primary or secondary syphilis"
    type "diagnosis"
    name "Primary or secondary syphilis"
  ]
  node [
    id 41
    label "Chancroid"
    type "diagnosis"
    name "Chancroid"
  ]
  node [
    id 42
    label "Lymphogranuloma venereum"
    type "diagnosis"
    name "Lymphogranuloma venereum"
  ]
  node [
    id 43
    label "Granuloma inguinale"
    type "diagnosis"
    name "Granuloma inguinale"
  ]
  node [
    id 44
    label "molluscum contagiosum"
    type "diagnosis"
    name "molluscum contagiosum"
  ]
  node [
    id 45
    label "allergic reaction (for example, to plants)"
    type "diagnosis"
    name "allergic reaction (for example, to plants)"
  ]
  node [
    id 46
    label "vesicular or papular rash"
    type "diagnosis"
    name "vesicular or papular rash"
  ]
  node [
    id 47
    label "Hepatosplenomegaly"
    type "symptom"
    name "Hepatosplenomegaly"
  ]
  node [
    id 48
    label "Diarrhea"
    type "symptom"
    name "Diarrhea"
  ]
  node [
    id 49
    label "Vomiting"
    type "symptom"
    name "Vomiting"
  ]
  node [
    id 50
    label "Convulsion (expected in seizures and osteochondritis)"
    type "symptom"
    name "Convulsion (expected in seizures and osteochondritis)"
  ]
  node [
    id 51
    label "Signs of central nervous system involvement"
    type "symptom"
    name "Signs of central nervous system involvement"
  ]
  node [
    id 52
    label "Anemia"
    type "symptom"
    name "Anemia"
  ]
  node [
    id 53
    label "Renal symptoms"
    type "symptom"
    name "Renal symptoms"
  ]
  node [
    id 54
    label "Decreased appetite"
    type "symptom"
    name "Decreased appetite"
  ]
  node [
    id 55
    label "Syphilis congenital and neonatal"
  ]
  node [
    id 56
    label "Acute flaccid paralysis"
    type "symptom"
    name "Acute flaccid paralysis"
    description "Weakness or floppiness of the limbs of sudden onset not due to trauma"
  ]
  node [
    id 57
    label "15 years old or less"
    type "demographic_criteria"
    name "15 years old or less"
    attribute "age"
    operator "<="
    value 15
    unit "years"
  ]
  node [
    id 58
    label "Acute Flaccid Paralysis (AFP)"
  ]
  node [
    id 59
    label "history of fever"
    type "symptom"
    name "history of fever"
  ]
  node [
    id 60
    label "Avian Influenza in Humans (AVIH)"
  ]
  node [
    id 61
    label "History of arthropod bite"
    type "professional_judgment"
    name "History of arthropod bite"
    description "Arthropod refers to insects or arachnids, such as mosquitoes"
  ]
  node [
    id 62
    label "Acute fever of unknown origin (FUO)"
    type "symptom"
    name "Acute fever of unknown origin (FUO)"
    description "Fever persisting for more than 3 days without an identified cause"
  ]
  node [
    id 63
    label "Arbovirosis in General"
  ]
  node [
    id 64
    label "Fever (axillary temperature >38.5&#176;C)"
    type "symptom"
    name "Fever (axillary temperature >38.5&#176;C)"
  ]
  node [
    id 65
    label "history of raised temperature prior to hospitalization"
    type "professional_judgment"
    name "history of raised temperature prior to hospitalization"
  ]
  node [
    id 66
    label "Nipah Like Illness"
  ]
  node [
    id 67
    label "Rash (maculopapular rash)"
    type "symptom"
    name "Rash (maculopapular rash)"
  ]
  node [
    id 68
    label "Catarrhal fever"
    type "symptom"
    name "Catarrhal fever"
  ]
  node [
    id 69
    label "Conjunctivitis"
    type "symptom"
    name "Conjunctivitis"
  ]
  node [
    id 70
    label "fever with/without respiratory symptoms"
    type "syndrome"
    name "fever with/without respiratory symptoms"
  ]
  node [
    id 71
    label "diarrhea"
    type "symptom"
    name "diarrhea"
  ]
  node [
    id 72
    label "vomiting"
    type "symptom"
    name "vomiting"
  ]
  node [
    id 73
    label "Middle East Respiratory Syndrome (MERS)"
  ]
  node [
    id 74
    label "severe febrile illness"
    type "symptom"
    name "severe febrile illness"
  ]
  node [
    id 75
    label "vital organ dysfunction"
    type "professional_judgment"
    name "vital organ dysfunction"
  ]
  node [
    id 76
    label "Unconfirmed Severe Malaria"
  ]
  node [
    id 77
    label "Sudden onset of unilateral or bilateral tender swelling of the parotid or other salivary glands"
    type "symptom"
    name "Sudden onset of unilateral or bilateral tender swelling of the parotid or other salivary glands"
  ]
  node [
    id 78
    label "Mumps"
  ]
  node [
    id 79
    label "Generalized maculopapular rash"
    type "symptom"
    name "Generalized maculopapular rash"
  ]
  node [
    id 80
    label "cough"
    type "symptom"
    name "cough"
  ]
  node [
    id 81
    label "coryza"
    type "symptom"
    name "coryza"
  ]
  node [
    id 82
    label "conjunctivitis"
    type "symptom"
    name "conjunctivitis"
  ]
  node [
    id 83
    label "Maculopapular rash"
    type "symptom"
    name "Maculopapular rash"
    description "non-vesicular"
  ]
  node [
    id 84
    label "Cutaneous eruption or genital, anal, or buccal mucosal ulceration"
    type "symptom"
    name "Cutaneous eruption or genital, anal, or buccal mucosal ulceration"
    description "evocative of mpox"
  ]
  node [
    id 85
    label "Odynophagia"
    type "symptom"
    name "Odynophagia"
  ]
  node [
    id 86
    label "Monkeypox"
  ]
  node [
    id 87
    label "Sudden fever"
    type "symptom"
    name "Sudden fever"
    logical_operator "OR"
    values [
      type "criteria"
      name "Rectal fever"
      description "Temperature > 38.5&#176;C in rectum"
    ]
    values [
      type "criteria"
      name "Axillary fever"
      description "Temperature &#8805; 38.0&#176;C in armpits"
    ]
  ]
  node [
    id 88
    label "Stiff neck"
    type "symptom"
    name "Stiff neck"
  ]
  node [
    id 89
    label "Altered consciousness"
    type "symptom"
    name "Altered consciousness"
  ]
  node [
    id 90
    label "Meningeal signs"
    type "symptom"
    name "Meningeal signs"
    description "Any other meningeal signs"
  ]
  node [
    id 91
    label "Meningococcal Meningitis"
  ]
  node [
    id 92
    label "Runny nose"
    type "symptom"
    name "Runny nose"
  ]
  node [
    id 93
    label "uncomplicated infection of the lower anogenital tract"
    type "diagnosis"
    name "uncomplicated infection of the lower anogenital tract"
    description "Anogenital includes urogenital and anorectal infection."
  ]
  node [
    id 94
    label "pelvic inflammatory disease"
    type "diagnosis"
    name "pelvic inflammatory disease"
    description "PID"
  ]
  node [
    id 95
    label "epididymitis"
    type "diagnosis"
    name "epididymitis"
  ]
  node [
    id 96
    label "Chlamydia"
  ]
  node [
    id 97
    label "fever"
    type "symptom"
    name "fever"
    description ">38.5&#176;C"
  ]
  node [
    id 98
    label "COVID-19 (Philippines)"
  ]
  node [
    id 99
    label "History of travel to or residence in communities where cases reported within the last 14 days"
    type "epidemiological_history"
    name "History of travel to or residence in communities where cases reported within the last 14 days"
  ]
  node [
    id 100
    label "In contact with a patient who has fever or respiratory symptoms or from a community with confirmed cases reported within the last 14 days"
    type "epidemiological_history"
    name "In contact with a patient who has fever or respiratory symptoms or from a community with confirmed cases reported within the last 14 days"
  ]
  node [
    id 101
    label "COVID-19 (Egypt)"
  ]
  node [
    id 102
    label "Confirmation by Laboratory with Positive Culture of Stool for Vibrio cholerae O1"
    type "diagnostic_test"
    name "Confirmation by Laboratory with Positive Culture of Stool for Vibrio cholerae O1"
  ]
  node [
    id 103
    label "Confirmation by Laboratory with Positive Culture of Stool for O139 Toxigenic"
    type "diagnostic_test"
    name "Confirmation by Laboratory with Positive Culture of Stool for O139 Toxigenic"
  ]
  node [
    id 104
    label "Confirmed Case of Cholera"
  ]
  node [
    id 105
    label "5 years old or more"
    type "demographic_criteria"
    name "5 years old or more"
    attribute "age"
    operator ">="
    value 5
    unit "years"
  ]
  node [
    id 106
    label "Acute watery diarrhea"
    type "symptom"
    name "Acute watery diarrhea"
  ]
  node [
    id 107
    label "Cholera"
  ]
  node [
    id 108
    label "Three or more loose or watery stools"
    type "symptom"
    name "Three or more loose or watery stools"
    attribute "stools"
    operator ">="
    value 3
    unit "occurrences"
  ]
  node [
    id 109
    label "Less than 24 hours"
    type "professional_judgment"
    name "Less than 24 hours"
    attribute "Time period"
    operator "<"
    value 24
    unit "hours"
  ]
  node [
    id 110
    label "poliuria"
    type "symptom"
    name "poliuria"
  ]
  node [
    id 111
    label "polidipsia"
    type "symptom"
    name "polidipsia"
  ]
  node [
    id 112
    label "polifagia"
    type "symptom"
    name "polifagia"
  ]
  node [
    id 113
    label "Casual plasma glucose greater than or equal to 200 mg/dL."
    type "diagnostic_test"
    name "Casual plasma glucose greater than or equal to 200 mg/dL."
    operator ">="
    value 200
    unit "mg/dL"
  ]
  node [
    id 114
    label "Non-Insulin-Dependent Diabetes Mellitus 'Type II' (E11-E14)"
  ]
  node [
    id 115
    label "Acute onset of high grade fever of usually 2-5 days or more"
    type "symptom"
    name "Acute onset of high grade fever of usually 2-5 days or more"
  ]
  node [
    id 116
    label "headache"
    type "symptom"
    name "headache"
  ]
  node [
    id 117
    label "retro-orbital pain"
    type "symptom"
    name "retro-orbital pain"
  ]
  node [
    id 118
    label "myalgia"
    type "symptom"
    name "myalgia"
  ]
  node [
    id 119
    label "arthralgia"
    type "symptom"
    name "arthralgia"
  ]
  node [
    id 120
    label "rash"
    type "symptom"
    name "rash"
  ]
  node [
    id 121
    label "mild haemorrhagic manifestation"
    type "symptom"
    name "mild haemorrhagic manifestation"
    description "e.g. epistaxis, gums bleeding and petechiae"
  ]
  node [
    id 122
    label "Dengue Fever"
  ]
  node [
    id 123
    label "Dengue in chief complaint"
    type "diagnosis"
    name "Dengue in chief complaint"
    description "Dengue word in chief complaint field"
    operator "regex"
    regex_pattern "dengue"
    regex_flags "i"
  ]
  node [
    id 124
    label "Dengue hemorrhagic fever"
    type "diagnosis"
    name "Dengue hemorrhagic fever"
    code [
      system "ICD-10"
      code "A91"
    ]
  ]
  node [
    id 125
    label "Dengue"
    type "diagnosis"
    name "Dengue"
    code [
      system "SNOMED-CT"
      code "38362002"
      display "Dengue"
    ]
  ]
  node [
    id 126
    label "Severe Dengue"
    type "diagnosis"
    name "Severe Dengue"
    code [
      system "SNOMED-CT"
      code "20927009"
      display "Severe Dengue"
    ]
  ]
  node [
    id 127
    label "Dengue shock syndrome"
    type "diagnosis"
    name "Dengue shock syndrome"
    code [
      system "SNOMED-CT"
      code "409671005"
      display "Dengue shock syndrome"
    ]
  ]
  node [
    id 128
    label "Myelitis caused by Dengue virus"
    type "diagnosis"
    name "Myelitis caused by Dengue virus"
    code [
      system "SNOMED-CT"
      code "866057003"
      display "Myelitis caused by Dengue virus"
    ]
  ]
  node [
    id 129
    label "Encephalitis caused by Dengue virus"
    type "diagnosis"
    name "Encephalitis caused by Dengue virus"
    code [
      system "SNOMED-CT"
      code "1163101003"
      display "Encephalitis caused by Dengue virus"
    ]
  ]
  node [
    id 130
    label "Sudden onset of abdominal pain, loss of appetite, weakness, nausea, vomiting"
    type "symptom"
    name "Sudden onset of abdominal pain, loss of appetite, weakness, nausea, vomiting"
  ]
  node [
    id 131
    label "Jaundice"
    type "symptom"
    name "Jaundice"
  ]
  node [
    id 132
    label "Increased serum aminotransferase (ALT and AST), urobilinogen in urine"
    type "symptom"
    name "Increased serum aminotransferase (ALT and AST), urobilinogen in urine"
  ]
  node [
    id 133
    label "Hepatitis A"
  ]
  node [
    id 134
    label "Sudden onset of high fever"
    type "symptom"
    name "Sudden onset of high fever"
  ]
  node [
    id 135
    label "Contact with a suspected, probable, or confirmed Ebola case"
    type "epidemiological_history"
    name "Contact with a suspected, probable, or confirmed Ebola case"
  ]
  node [
    id 136
    label "Contact with a dead or sick animal"
    type "epidemiological_history"
    name "Contact with a dead or sick animal"
  ]
  node [
    id 137
    label "Ebola Marburg Virus Cases"
  ]
  node [
    id 138
    label "Severe headache"
    type "symptom"
    name "Severe headache"
    description "intense"
  ]
  node [
    id 139
    label "Abdominal pain"
    type "symptom"
    name "Abdominal pain"
  ]
  node [
    id 140
    label "Unexplained hemorrhagic manifestation"
    type "symptom"
    name "Unexplained hemorrhagic manifestation"
  ]
  node [
    id 141
    label "Ebola"
  ]
  node [
    id 142
    label "Low body temperature"
    type "symptom"
    name "Low body temperature"
    attribute "body_temperature"
    operator "<="
    value 36
    unit "celsius"
  ]
  node [
    id 143
    label "Shivering"
    type "symptom"
    name "Shivering"
  ]
  node [
    id 144
    label "Weak pulse"
    type "symptom"
    name "Weak pulse"
  ]
  node [
    id 145
    label "Slow breathing"
    type "symptom"
    name "Slow breathing"
  ]
  node [
    id 146
    label "Local tissue damage due to freezing"
    type "symptom"
    name "Local tissue damage due to freezing"
  ]
  node [
    id 147
    label "Cold, red skin in babies"
    type "symptom"
    name "Cold, red skin in babies"
  ]
  node [
    id 148
    label "Cold Exposure"
  ]
  node [
    id 149
    label "High body temperature"
    type "symptom"
    name "High body temperature"
    attribute "body_temperature"
    operator ">="
    value 39
    unit "celsius"
  ]
  node [
    id 150
    label "Warm skin"
    type "symptom"
    name "Warm skin"
  ]
  node [
    id 151
    label "Sweating"
    type "symptom"
    name "Sweating"
  ]
  node [
    id 152
    label "Nausea/vomiting"
    type "symptom"
    name "Nausea/vomiting"
  ]
  node [
    id 153
    label "Hypotension"
    type "symptom"
    name "Hypotension"
  ]
  node [
    id 154
    label "Tachycardia"
    type "symptom"
    name "Tachycardia"
  ]
  node [
    id 155
    label "Tachypnea"
    type "symptom"
    name "Tachypnea"
  ]
  node [
    id 156
    label "Seizures"
    type "symptom"
    name "Seizures"
  ]
  node [
    id 157
    label "Fainting"
    type "symptom"
    name "Fainting"
  ]
  node [
    id 158
    label "Excessive sweating (infants)"
    type "symptom"
    name "Excessive sweating (infants)"
    description "Irritated skin due to sweating (infants)"
  ]
  node [
    id 159
    label "Heat Exposure"
  ]
  node [
    id 160
    label "Disorientation"
    type "symptom"
    name "Disorientation"
  ]
  node [
    id 161
    label "Tremors"
    type "symptom"
    name "Tremors"
  ]
  node [
    id 162
    label "Convulsions"
    type "symptom"
    name "Convulsions"
  ]
  node [
    id 163
    label "Paresthesias"
    type "symptom"
    name "Paresthesias"
  ]
  node [
    id 164
    label "Paralysis"
    type "symptom"
    name "Paralysis"
  ]
  node [
    id 165
    label "Somnolence"
    type "symptom"
    name "Somnolence"
  ]
  node [
    id 166
    label "Alteration of consciousness"
    type "symptom"
    name "Alteration of consciousness"
  ]
  node [
    id 167
    label "Stupor"
    type "symptom"
    name "Stupor"
  ]
  node [
    id 168
    label "Rigidity of neck"
    type "symptom"
    name "Rigidity of neck"
  ]
  node [
    id 169
    label "Suspected Case of Equine Encephalitis"
  ]
  node [
    id 170
    label "fatigue"
    type "symptom"
    name "fatigue"
  ]
  node [
    id 171
    label "chills"
    type "symptom"
    name "chills"
  ]
  node [
    id 172
    label "sweats"
    type "symptom"
    name "sweats"
  ]
  node [
    id 173
    label "anorexia"
    type "symptom"
    name "anorexia"
  ]
  node [
    id 174
    label "hemolytic anemia"
    type "symptom"
    name "hemolytic anemia"
  ]
  node [
    id 175
    label "thrombocytopenia"
    type "symptom"
    name "thrombocytopenia"
  ]
  node [
    id 176
    label "Babesiosis"
  ]
  node [
    id 177
    label "severe headache"
    type "symptom"
    name "severe headache"
  ]
  node [
    id 178
    label "pharyngitis"
    type "symptom"
    name "pharyngitis"
  ]
  node [
    id 179
    label "abdominal pain"
    type "symptom"
    name "abdominal pain"
  ]
  node [
    id 180
    label "retrosternal chest pain"
    type "symptom"
    name "retrosternal chest pain"
  ]
  node [
    id 181
    label "respiratory distress"
    type "symptom"
    name "respiratory distress"
  ]
  node [
    id 182
    label "moderate thrombocytopenia"
    type "symptom"
    name "moderate thrombocytopenia"
  ]
  node [
    id 183
    label "increased AST"
    type "symptom"
    name "increased AST"
  ]
  node [
    id 184
    label "leukocytosis"
    type "symptom"
    name "leukocytosis"
  ]
  node [
    id 185
    label "proteinuria"
    type "symptom"
    name "proteinuria"
  ]
  node [
    id 186
    label "neurological signs"
    type "symptom"
    name "neurological signs"
  ]
  node [
    id 187
    label "sudden inexplicable death"
    type "symptom"
    name "sudden inexplicable death"
  ]
  node [
    id 188
    label "Lujo Hemorrhagic Fever"
  ]
  node [
    id 189
    label "Lyme disease"
    type "diagnosis"
    name "Lyme disease"
    code [
      system "ICD-10"
      code "A692"
    ]
  ]
  node [
    id 190
    label "Bull's eye"
    type "symptom"
    name "Bull's eye"
  ]
  node [
    id 191
    label "Lyme Disease"
  ]
  node [
    id 192
    label "History of lyme disease"
    type "epidemiological_history"
    name "History of lyme disease"
  ]
  node [
    id 193
    label "Pneumonia"
    type "diagnosis"
    name "Pneumonia"
    description "Clinical or radiological diagnosis of pneumonia"
  ]
  node [
    id 194
    label "Outbreak exposure"
    type "epidemiological_history"
    name "Outbreak exposure"
    description "Location and onset date(s) meet the outbreak-specific case definition for the exposure category: community-acquired, healthcare-associated and travel-associated."
  ]
  node [
    id 195
    label "Probable Legionnaires' Disease"
  ]
  node [
    id 196
    label "General symptoms"
    type "symptom"
    name "General symptoms"
  ]
  node [
    id 197
    label "Dyspnea (respiratory distress)"
    type "symptom"
    name "Dyspnea (respiratory distress)"
  ]
  node [
    id 198
    label "Hemorrhagia (e.g., pulmonary hemorrhage, subconjunctival hemorrhage)"
    type "symptom"
    name "Hemorrhagia (e.g., pulmonary hemorrhage, subconjunctival hemorrhage)"
  ]
  node [
    id 199
    label "Icterus (jaundice)"
    type "symptom"
    name "Icterus (jaundice)"
  ]
  node [
    id 200
    label "Meningitis or meningoencephalitis"
    type "professional_judgment"
    name "Meningitis or meningoencephalitis"
  ]
  node [
    id 201
    label "Myocarditis (myocardial inflammation)"
    type "symptom"
    name "Myocarditis (myocardial inflammation)"
  ]
  node [
    id 202
    label "Renal function disorder"
    type "symptom"
    name "Renal function disorder"
  ]
  node [
    id 203
    label "Death due to disease"
    type "professional_judgment"
    name "Death due to disease"
  ]
  node [
    id 204
    label "Leptospirosis"
  ]
  node [
    id 205
    label "Clinical presentation compatible with plague"
    type "symptom"
    name "Clinical presentation compatible with plague"
  ]
  node [
    id 206
    label "Exposure to infected humans or animals"
    type "epidemiological_history"
    name "Exposure to infected humans or animals"
  ]
  node [
    id 207
    label "Evidence of flea bites"
    type "professional_judgment"
    name "Evidence of flea bites"
    description "Indicates presence of fleas on the patient"
  ]
  node [
    id 208
    label "Residence or travel to an endemic area, within the 10 days prior"
    type "epidemiological_history"
    name "Residence or travel to an endemic area, within the 10 days prior"
  ]
  node [
    id 209
    label "Suspected Plague"
  ]
  node [
    id 210
    label "wheeze"
    type "symptom"
    name "wheeze"
  ]
  node [
    id 211
    label "apnea"
    type "symptom"
    name "apnea"
  ]
  node [
    id 212
    label "cyanosis"
    type "symptom"
    name "cyanosis"
  ]
  node [
    id 213
    label "Respiratory syncitial virus (RSV)"
  ]
  edge [
    source 0
    target 1
  ]
  edge [
    source 0
    target 2
  ]
  edge [
    source 0
    target 3
  ]
  edge [
    source 1
    target 2
  ]
  edge [
    source 1
    target 3
  ]
  edge [
    source 1
    target 5
  ]
  edge [
    source 1
    target 6
  ]
  edge [
    source 1
    target 68
  ]
  edge [
    source 1
    target 69
  ]
  edge [
    source 1
    target 32
  ]
  edge [
    source 1
    target 92
  ]
  edge [
    source 1
    target 199
  ]
  edge [
    source 1
    target 200
  ]
  edge [
    source 1
    target 201
  ]
  edge [
    source 1
    target 202
  ]
  edge [
    source 1
    target 203
  ]
  edge [
    source 1
    target 204
  ]
  edge [
    source 2
    target 3
  ]
  edge [
    source 4
    target 1
  ]
  edge [
    source 4
    target 5
  ]
  edge [
    source 4
    target 6
  ]
  edge [
    source 4
    target 13
  ]
  edge [
    source 4
    target 14
  ]
  edge [
    source 4
    target 15
  ]
  edge [
    source 4
    target 16
  ]
  edge [
    source 4
    target 17
  ]
  edge [
    source 4
    target 59
  ]
  edge [
    source 4
    target 60
  ]
  edge [
    source 4
    target 61
  ]
  edge [
    source 4
    target 62
  ]
  edge [
    source 4
    target 63
  ]
  edge [
    source 4
    target 67
  ]
  edge [
    source 4
    target 68
  ]
  edge [
    source 4
    target 69
  ]
  edge [
    source 4
    target 32
  ]
  edge [
    source 4
    target 77
  ]
  edge [
    source 4
    target 78
  ]
  edge [
    source 4
    target 80
  ]
  edge [
    source 4
    target 81
  ]
  edge [
    source 4
    target 82
  ]
  edge [
    source 4
    target 83
  ]
  edge [
    source 4
    target 28
  ]
  edge [
    source 4
    target 85
  ]
  edge [
    source 4
    target 86
  ]
  edge [
    source 4
    target 12
  ]
  edge [
    source 4
    target 92
  ]
  edge [
    source 4
    target 131
  ]
  edge [
    source 4
    target 132
  ]
  edge [
    source 4
    target 133
  ]
  edge [
    source 4
    target 138
  ]
  edge [
    source 4
    target 49
  ]
  edge [
    source 4
    target 48
  ]
  edge [
    source 4
    target 139
  ]
  edge [
    source 4
    target 25
  ]
  edge [
    source 4
    target 140
  ]
  edge [
    source 4
    target 141
  ]
  edge [
    source 4
    target 198
  ]
  edge [
    source 4
    target 199
  ]
  edge [
    source 4
    target 200
  ]
  edge [
    source 4
    target 201
  ]
  edge [
    source 4
    target 202
  ]
  edge [
    source 4
    target 203
  ]
  edge [
    source 4
    target 204
  ]
  edge [
    source 5
    target 6
  ]
  edge [
    source 7
    target 6
  ]
  edge [
    source 8
    target 9
  ]
  edge [
    source 8
    target 10
  ]
  edge [
    source 8
    target 11
  ]
  edge [
    source 9
    target 10
  ]
  edge [
    source 9
    target 11
  ]
  edge [
    source 10
    target 11
  ]
  edge [
    source 12
    target 4
  ]
  edge [
    source 12
    target 13
  ]
  edge [
    source 12
    target 14
  ]
  edge [
    source 12
    target 15
  ]
  edge [
    source 12
    target 16
  ]
  edge [
    source 12
    target 17
  ]
  edge [
    source 12
    target 48
  ]
  edge [
    source 12
    target 49
  ]
  edge [
    source 12
    target 50
  ]
  edge [
    source 12
    target 51
  ]
  edge [
    source 12
    target 52
  ]
  edge [
    source 12
    target 53
  ]
  edge [
    source 12
    target 54
  ]
  edge [
    source 12
    target 55
  ]
  edge [
    source 12
    target 1
  ]
  edge [
    source 12
    target 92
  ]
  edge [
    source 12
    target 69
  ]
  edge [
    source 12
    target 32
  ]
  edge [
    source 12
    target 191
  ]
  edge [
    source 13
    target 14
  ]
  edge [
    source 13
    target 15
  ]
  edge [
    source 13
    target 16
  ]
  edge [
    source 13
    target 17
  ]
  edge [
    source 14
    target 15
  ]
  edge [
    source 14
    target 16
  ]
  edge [
    source 14
    target 17
  ]
  edge [
    source 15
    target 16
  ]
  edge [
    source 15
    target 17
  ]
  edge [
    source 16
    target 17
  ]
  edge [
    source 18
    target 19
  ]
  edge [
    source 18
    target 20
  ]
  edge [
    source 18
    target 21
  ]
  edge [
    source 19
    target 20
  ]
  edge [
    source 19
    target 21
  ]
  edge [
    source 20
    target 21
  ]
  edge [
    source 22
    target 23
  ]
  edge [
    source 22
    target 24
  ]
  edge [
    source 22
    target 25
  ]
  edge [
    source 22
    target 26
  ]
  edge [
    source 22
    target 27
  ]
  edge [
    source 22
    target 28
  ]
  edge [
    source 22
    target 29
  ]
  edge [
    source 23
    target 24
  ]
  edge [
    source 23
    target 25
  ]
  edge [
    source 23
    target 26
  ]
  edge [
    source 23
    target 27
  ]
  edge [
    source 23
    target 28
  ]
  edge [
    source 23
    target 29
  ]
  edge [
    source 23
    target 160
  ]
  edge [
    source 23
    target 161
  ]
  edge [
    source 23
    target 162
  ]
  edge [
    source 23
    target 163
  ]
  edge [
    source 23
    target 164
  ]
  edge [
    source 23
    target 165
  ]
  edge [
    source 23
    target 166
  ]
  edge [
    source 23
    target 167
  ]
  edge [
    source 23
    target 168
  ]
  edge [
    source 23
    target 169
  ]
  edge [
    source 24
    target 25
  ]
  edge [
    source 24
    target 26
  ]
  edge [
    source 24
    target 27
  ]
  edge [
    source 24
    target 28
  ]
  edge [
    source 24
    target 29
  ]
  edge [
    source 24
    target 23
  ]
  edge [
    source 24
    target 160
  ]
  edge [
    source 24
    target 161
  ]
  edge [
    source 24
    target 162
  ]
  edge [
    source 24
    target 163
  ]
  edge [
    source 24
    target 164
  ]
  edge [
    source 24
    target 165
  ]
  edge [
    source 24
    target 166
  ]
  edge [
    source 24
    target 167
  ]
  edge [
    source 24
    target 168
  ]
  edge [
    source 24
    target 169
  ]
  edge [
    source 25
    target 26
  ]
  edge [
    source 25
    target 27
  ]
  edge [
    source 25
    target 28
  ]
  edge [
    source 25
    target 29
  ]
  edge [
    source 25
    target 140
  ]
  edge [
    source 25
    target 141
  ]
  edge [
    source 26
    target 27
  ]
  edge [
    source 26
    target 28
  ]
  edge [
    source 26
    target 29
  ]
  edge [
    source 27
    target 28
  ]
  edge [
    source 27
    target 29
  ]
  edge [
    source 28
    target 29
  ]
  edge [
    source 28
    target 85
  ]
  edge [
    source 28
    target 86
  ]
  edge [
    source 30
    target 31
  ]
  edge [
    source 30
    target 32
  ]
  edge [
    source 30
    target 33
  ]
  edge [
    source 30
    target 34
  ]
  edge [
    source 30
    target 35
  ]
  edge [
    source 30
    target 36
  ]
  edge [
    source 30
    target 37
  ]
  edge [
    source 30
    target 38
  ]
  edge [
    source 30
    target 39
  ]
  edge [
    source 30
    target 40
  ]
  edge [
    source 30
    target 41
  ]
  edge [
    source 30
    target 42
  ]
  edge [
    source 30
    target 43
  ]
  edge [
    source 30
    target 44
  ]
  edge [
    source 30
    target 45
  ]
  edge [
    source 30
    target 46
  ]
  edge [
    source 30
    target 29
  ]
  edge [
    source 31
    target 32
  ]
  edge [
    source 31
    target 33
  ]
  edge [
    source 31
    target 34
  ]
  edge [
    source 31
    target 35
  ]
  edge [
    source 31
    target 36
  ]
  edge [
    source 31
    target 37
  ]
  edge [
    source 31
    target 38
  ]
  edge [
    source 31
    target 39
  ]
  edge [
    source 31
    target 40
  ]
  edge [
    source 31
    target 41
  ]
  edge [
    source 31
    target 42
  ]
  edge [
    source 31
    target 43
  ]
  edge [
    source 31
    target 44
  ]
  edge [
    source 31
    target 45
  ]
  edge [
    source 31
    target 46
  ]
  edge [
    source 31
    target 29
  ]
  edge [
    source 32
    target 33
  ]
  edge [
    source 32
    target 34
  ]
  edge [
    source 32
    target 35
  ]
  edge [
    source 32
    target 36
  ]
  edge [
    source 32
    target 37
  ]
  edge [
    source 32
    target 38
  ]
  edge [
    source 32
    target 39
  ]
  edge [
    source 32
    target 40
  ]
  edge [
    source 32
    target 41
  ]
  edge [
    source 32
    target 42
  ]
  edge [
    source 32
    target 43
  ]
  edge [
    source 32
    target 44
  ]
  edge [
    source 32
    target 45
  ]
  edge [
    source 32
    target 46
  ]
  edge [
    source 32
    target 29
  ]
  edge [
    source 33
    target 34
  ]
  edge [
    source 33
    target 35
  ]
  edge [
    source 33
    target 36
  ]
  edge [
    source 33
    target 37
  ]
  edge [
    source 33
    target 38
  ]
  edge [
    source 33
    target 39
  ]
  edge [
    source 33
    target 40
  ]
  edge [
    source 33
    target 41
  ]
  edge [
    source 33
    target 42
  ]
  edge [
    source 33
    target 43
  ]
  edge [
    source 33
    target 44
  ]
  edge [
    source 33
    target 45
  ]
  edge [
    source 33
    target 46
  ]
  edge [
    source 33
    target 29
  ]
  edge [
    source 34
    target 35
  ]
  edge [
    source 34
    target 36
  ]
  edge [
    source 34
    target 37
  ]
  edge [
    source 34
    target 38
  ]
  edge [
    source 34
    target 39
  ]
  edge [
    source 34
    target 40
  ]
  edge [
    source 34
    target 41
  ]
  edge [
    source 34
    target 42
  ]
  edge [
    source 34
    target 43
  ]
  edge [
    source 34
    target 44
  ]
  edge [
    source 34
    target 45
  ]
  edge [
    source 34
    target 46
  ]
  edge [
    source 34
    target 29
  ]
  edge [
    source 35
    target 36
  ]
  edge [
    source 35
    target 37
  ]
  edge [
    source 35
    target 38
  ]
  edge [
    source 35
    target 39
  ]
  edge [
    source 35
    target 40
  ]
  edge [
    source 35
    target 41
  ]
  edge [
    source 35
    target 42
  ]
  edge [
    source 35
    target 43
  ]
  edge [
    source 35
    target 44
  ]
  edge [
    source 35
    target 45
  ]
  edge [
    source 35
    target 46
  ]
  edge [
    source 35
    target 29
  ]
  edge [
    source 35
    target 124
  ]
  edge [
    source 35
    target 125
  ]
  edge [
    source 35
    target 126
  ]
  edge [
    source 35
    target 127
  ]
  edge [
    source 35
    target 128
  ]
  edge [
    source 35
    target 129
  ]
  edge [
    source 36
    target 37
  ]
  edge [
    source 36
    target 38
  ]
  edge [
    source 36
    target 39
  ]
  edge [
    source 36
    target 40
  ]
  edge [
    source 36
    target 41
  ]
  edge [
    source 36
    target 42
  ]
  edge [
    source 36
    target 43
  ]
  edge [
    source 36
    target 44
  ]
  edge [
    source 36
    target 45
  ]
  edge [
    source 36
    target 46
  ]
  edge [
    source 36
    target 29
  ]
  edge [
    source 37
    target 38
  ]
  edge [
    source 37
    target 39
  ]
  edge [
    source 37
    target 40
  ]
  edge [
    source 37
    target 41
  ]
  edge [
    source 37
    target 42
  ]
  edge [
    source 37
    target 43
  ]
  edge [
    source 37
    target 44
  ]
  edge [
    source 37
    target 45
  ]
  edge [
    source 37
    target 46
  ]
  edge [
    source 37
    target 29
  ]
  edge [
    source 38
    target 39
  ]
  edge [
    source 38
    target 40
  ]
  edge [
    source 38
    target 41
  ]
  edge [
    source 38
    target 42
  ]
  edge [
    source 38
    target 43
  ]
  edge [
    source 38
    target 44
  ]
  edge [
    source 38
    target 45
  ]
  edge [
    source 38
    target 46
  ]
  edge [
    source 38
    target 29
  ]
  edge [
    source 39
    target 40
  ]
  edge [
    source 39
    target 41
  ]
  edge [
    source 39
    target 42
  ]
  edge [
    source 39
    target 43
  ]
  edge [
    source 39
    target 44
  ]
  edge [
    source 39
    target 45
  ]
  edge [
    source 39
    target 46
  ]
  edge [
    source 39
    target 29
  ]
  edge [
    source 40
    target 41
  ]
  edge [
    source 40
    target 42
  ]
  edge [
    source 40
    target 43
  ]
  edge [
    source 40
    target 44
  ]
  edge [
    source 40
    target 45
  ]
  edge [
    source 40
    target 46
  ]
  edge [
    source 40
    target 29
  ]
  edge [
    source 41
    target 42
  ]
  edge [
    source 41
    target 43
  ]
  edge [
    source 41
    target 44
  ]
  edge [
    source 41
    target 45
  ]
  edge [
    source 41
    target 46
  ]
  edge [
    source 41
    target 29
  ]
  edge [
    source 42
    target 43
  ]
  edge [
    source 42
    target 44
  ]
  edge [
    source 42
    target 45
  ]
  edge [
    source 42
    target 46
  ]
  edge [
    source 42
    target 29
  ]
  edge [
    source 43
    target 44
  ]
  edge [
    source 43
    target 45
  ]
  edge [
    source 43
    target 46
  ]
  edge [
    source 43
    target 29
  ]
  edge [
    source 44
    target 45
  ]
  edge [
    source 44
    target 46
  ]
  edge [
    source 44
    target 29
  ]
  edge [
    source 45
    target 46
  ]
  edge [
    source 45
    target 29
  ]
  edge [
    source 46
    target 29
  ]
  edge [
    source 47
    target 12
  ]
  edge [
    source 47
    target 48
  ]
  edge [
    source 47
    target 49
  ]
  edge [
    source 47
    target 50
  ]
  edge [
    source 47
    target 51
  ]
  edge [
    source 47
    target 52
  ]
  edge [
    source 47
    target 53
  ]
  edge [
    source 47
    target 54
  ]
  edge [
    source 47
    target 55
  ]
  edge [
    source 48
    target 49
  ]
  edge [
    source 48
    target 50
  ]
  edge [
    source 48
    target 51
  ]
  edge [
    source 48
    target 52
  ]
  edge [
    source 48
    target 53
  ]
  edge [
    source 48
    target 54
  ]
  edge [
    source 48
    target 55
  ]
  edge [
    source 48
    target 139
  ]
  edge [
    source 48
    target 25
  ]
  edge [
    source 48
    target 140
  ]
  edge [
    source 48
    target 141
  ]
  edge [
    source 49
    target 50
  ]
  edge [
    source 49
    target 51
  ]
  edge [
    source 49
    target 52
  ]
  edge [
    source 49
    target 53
  ]
  edge [
    source 49
    target 54
  ]
  edge [
    source 49
    target 55
  ]
  edge [
    source 49
    target 48
  ]
  edge [
    source 49
    target 139
  ]
  edge [
    source 49
    target 25
  ]
  edge [
    source 49
    target 140
  ]
  edge [
    source 49
    target 141
  ]
  edge [
    source 50
    target 51
  ]
  edge [
    source 50
    target 52
  ]
  edge [
    source 50
    target 53
  ]
  edge [
    source 50
    target 54
  ]
  edge [
    source 50
    target 55
  ]
  edge [
    source 51
    target 52
  ]
  edge [
    source 51
    target 53
  ]
  edge [
    source 51
    target 54
  ]
  edge [
    source 51
    target 55
  ]
  edge [
    source 52
    target 53
  ]
  edge [
    source 52
    target 54
  ]
  edge [
    source 52
    target 55
  ]
  edge [
    source 53
    target 54
  ]
  edge [
    source 53
    target 55
  ]
  edge [
    source 54
    target 55
  ]
  edge [
    source 56
    target 57
  ]
  edge [
    source 56
    target 58
  ]
  edge [
    source 57
    target 58
  ]
  edge [
    source 59
    target 60
  ]
  edge [
    source 61
    target 62
  ]
  edge [
    source 61
    target 63
  ]
  edge [
    source 62
    target 63
  ]
  edge [
    source 64
    target 65
  ]
  edge [
    source 64
    target 66
  ]
  edge [
    source 65
    target 66
  ]
  edge [
    source 67
    target 1
  ]
  edge [
    source 67
    target 68
  ]
  edge [
    source 67
    target 69
  ]
  edge [
    source 67
    target 32
  ]
  edge [
    source 68
    target 69
  ]
  edge [
    source 68
    target 32
  ]
  edge [
    source 69
    target 32
  ]
  edge [
    source 70
    target 71
  ]
  edge [
    source 70
    target 72
  ]
  edge [
    source 70
    target 73
  ]
  edge [
    source 71
    target 72
  ]
  edge [
    source 71
    target 73
  ]
  edge [
    source 71
    target 178
  ]
  edge [
    source 71
    target 179
  ]
  edge [
    source 71
    target 180
  ]
  edge [
    source 71
    target 181
  ]
  edge [
    source 71
    target 182
  ]
  edge [
    source 71
    target 183
  ]
  edge [
    source 71
    target 184
  ]
  edge [
    source 71
    target 185
  ]
  edge [
    source 71
    target 186
  ]
  edge [
    source 71
    target 187
  ]
  edge [
    source 71
    target 188
  ]
  edge [
    source 72
    target 73
  ]
  edge [
    source 74
    target 75
  ]
  edge [
    source 74
    target 76
  ]
  edge [
    source 75
    target 76
  ]
  edge [
    source 77
    target 78
  ]
  edge [
    source 79
    target 4
  ]
  edge [
    source 79
    target 80
  ]
  edge [
    source 79
    target 81
  ]
  edge [
    source 79
    target 82
  ]
  edge [
    source 79
    target 32
  ]
  edge [
    source 80
    target 81
  ]
  edge [
    source 80
    target 82
  ]
  edge [
    source 80
    target 32
  ]
  edge [
    source 80
    target 98
  ]
  edge [
    source 81
    target 82
  ]
  edge [
    source 81
    target 32
  ]
  edge [
    source 82
    target 32
  ]
  edge [
    source 83
    target 32
  ]
  edge [
    source 84
    target 4
  ]
  edge [
    source 84
    target 28
  ]
  edge [
    source 84
    target 85
  ]
  edge [
    source 84
    target 86
  ]
  edge [
    source 85
    target 86
  ]
  edge [
    source 87
    target 88
  ]
  edge [
    source 87
    target 89
  ]
  edge [
    source 87
    target 90
  ]
  edge [
    source 87
    target 91
  ]
  edge [
    source 88
    target 89
  ]
  edge [
    source 88
    target 90
  ]
  edge [
    source 88
    target 91
  ]
  edge [
    source 89
    target 90
  ]
  edge [
    source 89
    target 91
  ]
  edge [
    source 89
    target 144
  ]
  edge [
    source 89
    target 145
  ]
  edge [
    source 89
    target 146
  ]
  edge [
    source 89
    target 147
  ]
  edge [
    source 89
    target 148
  ]
  edge [
    source 89
    target 156
  ]
  edge [
    source 89
    target 157
  ]
  edge [
    source 89
    target 158
  ]
  edge [
    source 89
    target 159
  ]
  edge [
    source 90
    target 91
  ]
  edge [
    source 92
    target 69
  ]
  edge [
    source 92
    target 32
  ]
  edge [
    source 93
    target 94
  ]
  edge [
    source 93
    target 95
  ]
  edge [
    source 93
    target 96
  ]
  edge [
    source 94
    target 95
  ]
  edge [
    source 94
    target 96
  ]
  edge [
    source 95
    target 96
  ]
  edge [
    source 97
    target 80
  ]
  edge [
    source 97
    target 98
  ]
  edge [
    source 97
    target 170
  ]
  edge [
    source 97
    target 171
  ]
  edge [
    source 97
    target 172
  ]
  edge [
    source 97
    target 116
  ]
  edge [
    source 97
    target 173
  ]
  edge [
    source 97
    target 174
  ]
  edge [
    source 97
    target 175
  ]
  edge [
    source 97
    target 176
  ]
  edge [
    source 97
    target 177
  ]
  edge [
    source 97
    target 118
  ]
  edge [
    source 97
    target 71
  ]
  edge [
    source 97
    target 178
  ]
  edge [
    source 97
    target 179
  ]
  edge [
    source 97
    target 180
  ]
  edge [
    source 97
    target 181
  ]
  edge [
    source 97
    target 182
  ]
  edge [
    source 97
    target 183
  ]
  edge [
    source 97
    target 184
  ]
  edge [
    source 97
    target 185
  ]
  edge [
    source 97
    target 186
  ]
  edge [
    source 97
    target 187
  ]
  edge [
    source 97
    target 188
  ]
  edge [
    source 99
    target 100
  ]
  edge [
    source 99
    target 101
  ]
  edge [
    source 100
    target 101
  ]
  edge [
    source 102
    target 103
  ]
  edge [
    source 102
    target 104
  ]
  edge [
    source 103
    target 104
  ]
  edge [
    source 105
    target 106
  ]
  edge [
    source 105
    target 107
  ]
  edge [
    source 106
    target 107
  ]
  edge [
    source 108
    target 109
  ]
  edge [
    source 108
    target 48
  ]
  edge [
    source 109
    target 48
  ]
  edge [
    source 110
    target 111
  ]
  edge [
    source 110
    target 112
  ]
  edge [
    source 110
    target 113
  ]
  edge [
    source 110
    target 114
  ]
  edge [
    source 111
    target 112
  ]
  edge [
    source 111
    target 113
  ]
  edge [
    source 111
    target 114
  ]
  edge [
    source 112
    target 113
  ]
  edge [
    source 112
    target 114
  ]
  edge [
    source 113
    target 114
  ]
  edge [
    source 115
    target 116
  ]
  edge [
    source 115
    target 117
  ]
  edge [
    source 115
    target 118
  ]
  edge [
    source 115
    target 119
  ]
  edge [
    source 115
    target 120
  ]
  edge [
    source 115
    target 121
  ]
  edge [
    source 115
    target 122
  ]
  edge [
    source 116
    target 117
  ]
  edge [
    source 116
    target 118
  ]
  edge [
    source 116
    target 119
  ]
  edge [
    source 116
    target 120
  ]
  edge [
    source 116
    target 121
  ]
  edge [
    source 116
    target 122
  ]
  edge [
    source 116
    target 173
  ]
  edge [
    source 116
    target 174
  ]
  edge [
    source 116
    target 175
  ]
  edge [
    source 116
    target 176
  ]
  edge [
    source 117
    target 118
  ]
  edge [
    source 117
    target 119
  ]
  edge [
    source 117
    target 120
  ]
  edge [
    source 117
    target 121
  ]
  edge [
    source 117
    target 122
  ]
  edge [
    source 118
    target 119
  ]
  edge [
    source 118
    target 120
  ]
  edge [
    source 118
    target 121
  ]
  edge [
    source 118
    target 122
  ]
  edge [
    source 118
    target 71
  ]
  edge [
    source 118
    target 178
  ]
  edge [
    source 118
    target 179
  ]
  edge [
    source 118
    target 180
  ]
  edge [
    source 118
    target 181
  ]
  edge [
    source 118
    target 182
  ]
  edge [
    source 118
    target 183
  ]
  edge [
    source 118
    target 184
  ]
  edge [
    source 118
    target 185
  ]
  edge [
    source 118
    target 186
  ]
  edge [
    source 118
    target 187
  ]
  edge [
    source 118
    target 188
  ]
  edge [
    source 119
    target 120
  ]
  edge [
    source 119
    target 121
  ]
  edge [
    source 119
    target 122
  ]
  edge [
    source 120
    target 121
  ]
  edge [
    source 120
    target 122
  ]
  edge [
    source 121
    target 122
  ]
  edge [
    source 123
    target 35
  ]
  edge [
    source 123
    target 124
  ]
  edge [
    source 123
    target 125
  ]
  edge [
    source 123
    target 126
  ]
  edge [
    source 123
    target 127
  ]
  edge [
    source 123
    target 128
  ]
  edge [
    source 123
    target 129
  ]
  edge [
    source 124
    target 125
  ]
  edge [
    source 124
    target 126
  ]
  edge [
    source 124
    target 127
  ]
  edge [
    source 124
    target 128
  ]
  edge [
    source 124
    target 129
  ]
  edge [
    source 125
    target 125
  ]
  edge [
    source 125
    target 126
  ]
  edge [
    source 125
    target 127
  ]
  edge [
    source 125
    target 128
  ]
  edge [
    source 125
    target 129
  ]
  edge [
    source 126
    target 127
  ]
  edge [
    source 126
    target 128
  ]
  edge [
    source 126
    target 129
  ]
  edge [
    source 126
    target 125
  ]
  edge [
    source 127
    target 128
  ]
  edge [
    source 127
    target 129
  ]
  edge [
    source 127
    target 125
  ]
  edge [
    source 128
    target 129
  ]
  edge [
    source 128
    target 125
  ]
  edge [
    source 129
    target 125
  ]
  edge [
    source 130
    target 4
  ]
  edge [
    source 130
    target 131
  ]
  edge [
    source 130
    target 132
  ]
  edge [
    source 130
    target 133
  ]
  edge [
    source 131
    target 132
  ]
  edge [
    source 131
    target 133
  ]
  edge [
    source 132
    target 133
  ]
  edge [
    source 134
    target 135
  ]
  edge [
    source 134
    target 136
  ]
  edge [
    source 134
    target 137
  ]
  edge [
    source 135
    target 136
  ]
  edge [
    source 135
    target 137
  ]
  edge [
    source 136
    target 137
  ]
  edge [
    source 138
    target 49
  ]
  edge [
    source 138
    target 48
  ]
  edge [
    source 138
    target 139
  ]
  edge [
    source 138
    target 25
  ]
  edge [
    source 138
    target 140
  ]
  edge [
    source 138
    target 141
  ]
  edge [
    source 139
    target 25
  ]
  edge [
    source 139
    target 140
  ]
  edge [
    source 139
    target 141
  ]
  edge [
    source 140
    target 141
  ]
  edge [
    source 142
    target 143
  ]
  edge [
    source 142
    target 89
  ]
  edge [
    source 142
    target 144
  ]
  edge [
    source 142
    target 145
  ]
  edge [
    source 142
    target 146
  ]
  edge [
    source 142
    target 147
  ]
  edge [
    source 142
    target 148
  ]
  edge [
    source 143
    target 89
  ]
  edge [
    source 143
    target 144
  ]
  edge [
    source 143
    target 145
  ]
  edge [
    source 143
    target 146
  ]
  edge [
    source 143
    target 147
  ]
  edge [
    source 143
    target 148
  ]
  edge [
    source 144
    target 145
  ]
  edge [
    source 144
    target 146
  ]
  edge [
    source 144
    target 147
  ]
  edge [
    source 144
    target 148
  ]
  edge [
    source 145
    target 146
  ]
  edge [
    source 145
    target 147
  ]
  edge [
    source 145
    target 148
  ]
  edge [
    source 146
    target 147
  ]
  edge [
    source 146
    target 148
  ]
  edge [
    source 147
    target 148
  ]
  edge [
    source 149
    target 150
  ]
  edge [
    source 149
    target 151
  ]
  edge [
    source 149
    target 152
  ]
  edge [
    source 149
    target 153
  ]
  edge [
    source 149
    target 154
  ]
  edge [
    source 149
    target 155
  ]
  edge [
    source 149
    target 89
  ]
  edge [
    source 149
    target 156
  ]
  edge [
    source 149
    target 157
  ]
  edge [
    source 149
    target 158
  ]
  edge [
    source 149
    target 159
  ]
  edge [
    source 150
    target 151
  ]
  edge [
    source 150
    target 152
  ]
  edge [
    source 150
    target 153
  ]
  edge [
    source 150
    target 154
  ]
  edge [
    source 150
    target 155
  ]
  edge [
    source 150
    target 89
  ]
  edge [
    source 150
    target 156
  ]
  edge [
    source 150
    target 157
  ]
  edge [
    source 150
    target 158
  ]
  edge [
    source 150
    target 159
  ]
  edge [
    source 151
    target 152
  ]
  edge [
    source 151
    target 153
  ]
  edge [
    source 151
    target 154
  ]
  edge [
    source 151
    target 155
  ]
  edge [
    source 151
    target 89
  ]
  edge [
    source 151
    target 156
  ]
  edge [
    source 151
    target 157
  ]
  edge [
    source 151
    target 158
  ]
  edge [
    source 151
    target 159
  ]
  edge [
    source 152
    target 153
  ]
  edge [
    source 152
    target 154
  ]
  edge [
    source 152
    target 155
  ]
  edge [
    source 152
    target 89
  ]
  edge [
    source 152
    target 156
  ]
  edge [
    source 152
    target 157
  ]
  edge [
    source 152
    target 158
  ]
  edge [
    source 152
    target 159
  ]
  edge [
    source 153
    target 154
  ]
  edge [
    source 153
    target 155
  ]
  edge [
    source 153
    target 89
  ]
  edge [
    source 153
    target 156
  ]
  edge [
    source 153
    target 157
  ]
  edge [
    source 153
    target 158
  ]
  edge [
    source 153
    target 159
  ]
  edge [
    source 154
    target 155
  ]
  edge [
    source 154
    target 89
  ]
  edge [
    source 154
    target 156
  ]
  edge [
    source 154
    target 157
  ]
  edge [
    source 154
    target 158
  ]
  edge [
    source 154
    target 159
  ]
  edge [
    source 155
    target 89
  ]
  edge [
    source 155
    target 156
  ]
  edge [
    source 155
    target 157
  ]
  edge [
    source 155
    target 158
  ]
  edge [
    source 155
    target 159
  ]
  edge [
    source 156
    target 157
  ]
  edge [
    source 156
    target 158
  ]
  edge [
    source 156
    target 159
  ]
  edge [
    source 157
    target 158
  ]
  edge [
    source 157
    target 159
  ]
  edge [
    source 158
    target 159
  ]
  edge [
    source 160
    target 161
  ]
  edge [
    source 160
    target 162
  ]
  edge [
    source 160
    target 163
  ]
  edge [
    source 160
    target 164
  ]
  edge [
    source 160
    target 165
  ]
  edge [
    source 160
    target 166
  ]
  edge [
    source 160
    target 167
  ]
  edge [
    source 160
    target 168
  ]
  edge [
    source 160
    target 169
  ]
  edge [
    source 161
    target 162
  ]
  edge [
    source 161
    target 163
  ]
  edge [
    source 161
    target 164
  ]
  edge [
    source 161
    target 165
  ]
  edge [
    source 161
    target 166
  ]
  edge [
    source 161
    target 167
  ]
  edge [
    source 161
    target 168
  ]
  edge [
    source 161
    target 169
  ]
  edge [
    source 162
    target 163
  ]
  edge [
    source 162
    target 164
  ]
  edge [
    source 162
    target 165
  ]
  edge [
    source 162
    target 166
  ]
  edge [
    source 162
    target 167
  ]
  edge [
    source 162
    target 168
  ]
  edge [
    source 162
    target 169
  ]
  edge [
    source 163
    target 164
  ]
  edge [
    source 163
    target 165
  ]
  edge [
    source 163
    target 166
  ]
  edge [
    source 163
    target 167
  ]
  edge [
    source 163
    target 168
  ]
  edge [
    source 163
    target 169
  ]
  edge [
    source 164
    target 165
  ]
  edge [
    source 164
    target 166
  ]
  edge [
    source 164
    target 167
  ]
  edge [
    source 164
    target 168
  ]
  edge [
    source 164
    target 169
  ]
  edge [
    source 165
    target 166
  ]
  edge [
    source 165
    target 167
  ]
  edge [
    source 165
    target 168
  ]
  edge [
    source 165
    target 169
  ]
  edge [
    source 166
    target 167
  ]
  edge [
    source 166
    target 168
  ]
  edge [
    source 166
    target 169
  ]
  edge [
    source 167
    target 168
  ]
  edge [
    source 167
    target 169
  ]
  edge [
    source 168
    target 169
  ]
  edge [
    source 170
    target 171
  ]
  edge [
    source 170
    target 172
  ]
  edge [
    source 170
    target 116
  ]
  edge [
    source 170
    target 173
  ]
  edge [
    source 170
    target 174
  ]
  edge [
    source 170
    target 175
  ]
  edge [
    source 170
    target 176
  ]
  edge [
    source 171
    target 172
  ]
  edge [
    source 171
    target 116
  ]
  edge [
    source 171
    target 173
  ]
  edge [
    source 171
    target 174
  ]
  edge [
    source 171
    target 175
  ]
  edge [
    source 171
    target 176
  ]
  edge [
    source 172
    target 116
  ]
  edge [
    source 172
    target 173
  ]
  edge [
    source 172
    target 174
  ]
  edge [
    source 172
    target 175
  ]
  edge [
    source 172
    target 176
  ]
  edge [
    source 173
    target 174
  ]
  edge [
    source 173
    target 175
  ]
  edge [
    source 173
    target 176
  ]
  edge [
    source 174
    target 175
  ]
  edge [
    source 174
    target 176
  ]
  edge [
    source 175
    target 176
  ]
  edge [
    source 177
    target 118
  ]
  edge [
    source 177
    target 71
  ]
  edge [
    source 177
    target 178
  ]
  edge [
    source 177
    target 179
  ]
  edge [
    source 177
    target 180
  ]
  edge [
    source 177
    target 181
  ]
  edge [
    source 177
    target 182
  ]
  edge [
    source 177
    target 183
  ]
  edge [
    source 177
    target 184
  ]
  edge [
    source 177
    target 185
  ]
  edge [
    source 177
    target 186
  ]
  edge [
    source 177
    target 187
  ]
  edge [
    source 177
    target 188
  ]
  edge [
    source 178
    target 179
  ]
  edge [
    source 178
    target 180
  ]
  edge [
    source 178
    target 181
  ]
  edge [
    source 178
    target 182
  ]
  edge [
    source 178
    target 183
  ]
  edge [
    source 178
    target 184
  ]
  edge [
    source 178
    target 185
  ]
  edge [
    source 178
    target 186
  ]
  edge [
    source 178
    target 187
  ]
  edge [
    source 178
    target 188
  ]
  edge [
    source 179
    target 180
  ]
  edge [
    source 179
    target 181
  ]
  edge [
    source 179
    target 182
  ]
  edge [
    source 179
    target 183
  ]
  edge [
    source 179
    target 184
  ]
  edge [
    source 179
    target 185
  ]
  edge [
    source 179
    target 186
  ]
  edge [
    source 179
    target 187
  ]
  edge [
    source 179
    target 188
  ]
  edge [
    source 180
    target 181
  ]
  edge [
    source 180
    target 182
  ]
  edge [
    source 180
    target 183
  ]
  edge [
    source 180
    target 184
  ]
  edge [
    source 180
    target 185
  ]
  edge [
    source 180
    target 186
  ]
  edge [
    source 180
    target 187
  ]
  edge [
    source 180
    target 188
  ]
  edge [
    source 181
    target 182
  ]
  edge [
    source 181
    target 183
  ]
  edge [
    source 181
    target 184
  ]
  edge [
    source 181
    target 185
  ]
  edge [
    source 181
    target 186
  ]
  edge [
    source 181
    target 187
  ]
  edge [
    source 181
    target 188
  ]
  edge [
    source 182
    target 183
  ]
  edge [
    source 182
    target 184
  ]
  edge [
    source 182
    target 185
  ]
  edge [
    source 182
    target 186
  ]
  edge [
    source 182
    target 187
  ]
  edge [
    source 182
    target 188
  ]
  edge [
    source 183
    target 184
  ]
  edge [
    source 183
    target 185
  ]
  edge [
    source 183
    target 186
  ]
  edge [
    source 183
    target 187
  ]
  edge [
    source 183
    target 188
  ]
  edge [
    source 184
    target 185
  ]
  edge [
    source 184
    target 186
  ]
  edge [
    source 184
    target 187
  ]
  edge [
    source 184
    target 188
  ]
  edge [
    source 185
    target 186
  ]
  edge [
    source 185
    target 187
  ]
  edge [
    source 185
    target 188
  ]
  edge [
    source 186
    target 187
  ]
  edge [
    source 186
    target 188
  ]
  edge [
    source 187
    target 188
  ]
  edge [
    source 189
    target 190
  ]
  edge [
    source 189
    target 12
  ]
  edge [
    source 189
    target 191
  ]
  edge [
    source 190
    target 12
  ]
  edge [
    source 190
    target 191
  ]
  edge [
    source 192
    target 191
  ]
  edge [
    source 193
    target 194
  ]
  edge [
    source 193
    target 195
  ]
  edge [
    source 194
    target 195
  ]
  edge [
    source 196
    target 197
  ]
  edge [
    source 196
    target 4
  ]
  edge [
    source 196
    target 198
  ]
  edge [
    source 196
    target 1
  ]
  edge [
    source 196
    target 199
  ]
  edge [
    source 196
    target 200
  ]
  edge [
    source 196
    target 201
  ]
  edge [
    source 196
    target 202
  ]
  edge [
    source 196
    target 203
  ]
  edge [
    source 196
    target 204
  ]
  edge [
    source 197
    target 4
  ]
  edge [
    source 197
    target 198
  ]
  edge [
    source 197
    target 1
  ]
  edge [
    source 197
    target 199
  ]
  edge [
    source 197
    target 200
  ]
  edge [
    source 197
    target 201
  ]
  edge [
    source 197
    target 202
  ]
  edge [
    source 197
    target 203
  ]
  edge [
    source 197
    target 204
  ]
  edge [
    source 198
    target 1
  ]
  edge [
    source 198
    target 199
  ]
  edge [
    source 198
    target 200
  ]
  edge [
    source 198
    target 201
  ]
  edge [
    source 198
    target 202
  ]
  edge [
    source 198
    target 203
  ]
  edge [
    source 198
    target 204
  ]
  edge [
    source 199
    target 200
  ]
  edge [
    source 199
    target 201
  ]
  edge [
    source 199
    target 202
  ]
  edge [
    source 199
    target 203
  ]
  edge [
    source 199
    target 204
  ]
  edge [
    source 200
    target 201
  ]
  edge [
    source 200
    target 202
  ]
  edge [
    source 200
    target 203
  ]
  edge [
    source 200
    target 204
  ]
  edge [
    source 201
    target 202
  ]
  edge [
    source 201
    target 203
  ]
  edge [
    source 201
    target 204
  ]
  edge [
    source 202
    target 203
  ]
  edge [
    source 202
    target 204
  ]
  edge [
    source 203
    target 204
  ]
  edge [
    source 205
    target 206
  ]
  edge [
    source 205
    target 207
  ]
  edge [
    source 205
    target 208
  ]
  edge [
    source 205
    target 209
  ]
  edge [
    source 206
    target 207
  ]
  edge [
    source 206
    target 208
  ]
  edge [
    source 206
    target 209
  ]
  edge [
    source 207
    target 208
  ]
  edge [
    source 207
    target 209
  ]
  edge [
    source 208
    target 209
  ]
  edge [
    source 210
    target 211
  ]
  edge [
    source 210
    target 212
  ]
  edge [
    source 210
    target 213
  ]
  edge [
    source 211
    target 212
  ]
  edge [
    source 211
    target 213
  ]
  edge [
    source 212
    target 213
  ]
]
