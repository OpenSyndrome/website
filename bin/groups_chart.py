import polars as pl
from io import StringIO


csv_data = """Disease,Clinical presentation,Transmission,immunopreventable
Acute flaccid paralysis (Poliomyelitis),Neurologic,waterborne,immunopreventable
Acute intussusception in infants,Gastrointestinal,non-communicable,
Arbovirosis en general,Acute febril syndrome,arboviral,
Avian Influenza in Humans (AVIH),Respiratory,zoonosis,
Babesiosis,Acute febril syndrome,zoonosis,
COVID-19,Respiratory,respiratory,
Chlamydia,Sexually Transmitted Infections,sexually-transmitted,
Cholera,Gastrointestinal,waterborne,
Cholera,Gastrointestinal,waterborne,
Dengue,Acute febril syndrome,arboviral,
Dengue fever,Acute febril syndrome,arboviral,
Diarrhea,Gastrointestinal,waterborne,
Ebola,Viral hemorragic fever,zoonosis,
Ebola and Marburg virus,Viral hemorragic fever,zoonosis,
Equine encephalitis,Neurologic,zoonosis,
Extreme temperatures (hot and cold),non-communicable,climate-related,
Human Nipah virus,Neurologic,zoonosis,
Influenza-Like Illness (ILI),Respiratory,respiratory,
Influenza-Like Illness (ILI),Respiratory,respiratory,
Legionnaires' disease,Respiratory,respiratory,
Leptospirose,Icterohaemorragic fever,zoonosis,
Lujo,Viral hemorragic fever,zoonosis,
Lyme disease,Acute febril syndrome,zoonosis,
Malaria,Acute febril syndrome,zoonosis,
Measles,Rash,respiratory,immunopreventable
Measles,Rash,respiratory,immunopreventable
Measles,Rash,respiratory,immunopreventable
Meningococcal meningitis,Neurologic,respiratory,
Middle east respiratory syndrome,Respiratory,respiratory,
Mpox,Rash,zoonosis,
Mumps,Rash,respiratory,immunopreventable
Non-Insulin-Dependent Diabetes Mellitus 'Type II' (E11-E14),non-communicable,non-communicable,
Plague,bioterrorism,zoonosis,
Respiratory syncitial virus (RSV),Respiratory,respiratory,
Smallpox,bioterrorism,respiratory,
Syphilis congenital and neonatal,Congenital bacterial infections,mother-to-child transmission,
Tuberculosis,Respiratory,respiratory,
Viral Hepatitis A,Gastrointestinal,waterborne,
Zyka,Rash,arboviral,"""

df = pl.read_csv(StringIO(csv_data))

counts = (df
    .group_by("Transmission")
    .agg(pl.len().alias("count"))
    .sort("count", descending=True)
)

print("Clinical Presentation Counts:")
print(counts)

labels = counts["Transmission"].to_list()
data = counts["count"].to_list()

print("\n{{< chart >}}")
print("type: 'bar',")
print("data: {")
print(f"  labels: {labels},")
print("  datasets: [{")
print("    label: 'Count of Clinical Presentations',")
print(f"    data: {data},")
print("  }]")
print("}")
print("{{< /chart >}}")
