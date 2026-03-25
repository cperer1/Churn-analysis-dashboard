import pandas as pd

df = pd.read_csv(
r"C:\Users\Usuario\Desktop\Desarrollo\Proyecto_4_Customer Retention & Churn Analysis\data\Telco-Customer-Churn.csv"
)

print(df.columns)

# limpiar nombres columnas
df.columns = df.columns.str.strip().str.lower()

# eliminar filas vacias
df = df.dropna(how="all")

# limpiar TotalCharges (MUY IMPORTANTE)
df['totalcharges'] = pd.to_numeric(
    df['totalcharges'],
    errors='coerce'
)

# eliminar filas con errores importantes
df = df.dropna(subset=['totalcharges'])

# eliminar duplicados
df = df.drop_duplicates()

# guardar limpio
df.to_csv("churn_clean.csv", index=False)

print("Dataset limpio ")