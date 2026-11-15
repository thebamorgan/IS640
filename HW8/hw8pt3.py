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

# Part 3: Decision tree with max_depth=3
tree_3 = DecisionTreeClassifier(max_depth=3, random_state=0)
tree_3.fit(X_train, y_train)

print(f"\nPart 3 — max_depth=3 | Leaves: {tree_3.get_n_leaves()} | Train accuracy: {tree_3.score(X_train, y_train):.3f} | Test accuracy: {tree_3.score(X_test, y_test):.3f}\n")
print(export_text(tree_3, feature_names=list(X_train.columns), show_weights=True))