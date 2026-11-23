import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier, export_text
from sklearn.metrics import accuracy_score

train = pd.read_csv('hw8_train.csv')
test = pd.read_csv('hw8_test.csv')

print("Train shape:", train.shape)
print("Test shape:", test.shape)
print(train.head())

features = ['n_courses', 'n_terms', 'credits_total', 'last_term', 'gpa', 'has_gpa']
X_train, y_train = train[features], train['retained']
X_test, y_test = test[features], test['retained']

# Part 1: Retained 1
baseline_acc = (y_test == 1).mean()
print(f"\nPart 1 — Baseline test accuracy (retained 1): {baseline_acc:.3f}\n")

# Part 2: Decision tree with max_depth=1
tree_1 = DecisionTreeClassifier(max_depth=1, random_state=0)
tree_1.fit(X_train, y_train)
print(f"Part 2 — max_depth=1 | Train accuracy: {tree_1.score(X_train, y_train):.3f} | Test accuracy: {tree_1.score(X_test, y_test):.3f}")
print(export_text(tree_1, feature_names=list(X_train.columns)))

# Part 3: Decision tree with max_depth=3
tree_3 = DecisionTreeClassifier(max_depth=3, random_state=0)
tree_3.fit(X_train, y_train)
print(f"Part 3 — max_depth=3 | Leaves: {tree_3.get_n_leaves()} | Train accuracy: {tree_3.score(X_train, y_train):.3f} | Test accuracy: {tree_3.score(X_test, y_test):.3f}\n")

# Part 4: Loop over depths 1, 2, 3, 5, 8, and None
print("Part 4 — Depth Comparison:")
for d in [1, 2, 3, 5, 8, None]:
    clf = DecisionTreeClassifier(max_depth=d, random_state=0)
    clf.fit(X_train, y_train)
    print(f"max_depth={str(d):<4} | leaves={clf.get_n_leaves():<3} | "
          f"train={clf.score(X_train, y_train):.3f} | test={clf.score(X_test, y_test):.3f}")