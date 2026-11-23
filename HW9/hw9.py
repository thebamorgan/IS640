import pandas as pd
import numpy as np
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans

# --- Part 1.3 ---
train = pd.read_csv('hw8_train.csv')
test = pd.read_csv('hw8_test.csv')
hw = pd.concat([train, test], ignore_index=True)

print("Shape:", hw.shape)
print(hw.head())

# --- Part 2.1 ---
no_gpa = hw[hw['has_gpa'] == 0]
print("Students with has_gpa == 0:", len(no_gpa))
print("Their GPAs:", no_gpa['gpa'].tolist())

hw = hw[hw['has_gpa'] == 1].copy()
print("Students remaining:", len(hw))

# --- Part 2.3 ---
features = ['last_term', 'n_courses', 'gpa']
scaler = StandardScaler()
X_scaled = scaler.fit_transform(hw[features])

print("Means (rounded):", np.round(scaler.mean_, 2))
print("SDs (rounded):", np.round(scaler.scale_, 2))
print("SDs after scaling:", np.round(X_scaled.std(axis=0), 2))


# --- Part 3.1 ---
kmeans3 = KMeans(n_clusters=3, n_init=10, random_state=0)
hw['cluster'] = kmeans3.fit_predict(X_scaled)

summary3 = hw.groupby('cluster').agg(
    n_students=('student_id', 'count'),
    avg_last_term=('last_term', 'mean'),
    avg_n_courses=('n_courses', 'mean'),
    avg_gpa=('gpa', 'mean')
).reset_index()

print(summary3.round(2))

# --- Part 3.2 ---
for k in range(2, 7):
    km = KMeans(n_clusters=k, n_init=10, random_state=0)
    labels = km.fit_predict(X_scaled)
    counts = pd.Series(labels).value_counts().sort_index().tolist()
    print(f"k = {k}: {counts}")

    # --- Part 4.1 ---
centers = np.round(kmeans3.cluster_centers_, 4)
for i, c in enumerate(centers):
    print(f"Cluster {i}: last_term={c[0]}, n_courses={c[1]}, gpa={c[2]}")

    # --- Part 6.1 ---
kmeans4 = KMeans(n_clusters=4, n_init=10, random_state=0)
hw['cluster4'] = kmeans4.fit_predict(X_scaled)

summary4 = hw.groupby('cluster4').agg(
    n_students=('student_id', 'count'),
    avg_last_term=('last_term', 'mean'),
    avg_n_courses=('n_courses', 'mean'),
    avg_gpa=('gpa', 'mean'),
    retained_share=('retained', 'mean')
).reset_index()

print(summary4.round(2))