{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import joblib\n",
    "import pickle\n",
    "import numpy as np\n",
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns\n",
    "import pandas as pd\n",
    "\n",
    "from sklearn import svm\n",
    "from sklearn.metrics import classification_report, confusion_matrix, accuracy_score, f1_score, roc_curve\n",
    "from sklearn.model_selection import train_test_split, GridSearchCV\n",
    "from sklearn.naive_bayes import CategoricalNB, BernoulliNB, MultinomialNB, GaussianNB\n",
    "from sklearn.neural_network import MLPClassifier\n",
    "from sklearn.ensemble import RandomForestClassifier\n",
    "from sklearn.tree import DecisionTreeClassifier, plot_tree\n",
    "from sklearn.linear_model import LogisticRegression\n",
    "from sklearn.preprocessing import MinMaxScaler\n",
    "from sklearn.metrics import precision_recall_curve\n",
    "from sklearn.metrics import average_precision_score\n",
    "from sklearn.preprocessing import label_binarize\n",
    "\n",
    "\n",
    "from nltk.corpus import stopwords"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# #Reading the file and converting it into dataframe\n",
    "# temp_df = pd.read_json('temp_json.json', orient = 'records')\n",
    "# print(temp_df[\"Severity\"])\n",
    "# temp_df = temp_df.drop(\"Severity\", axis=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "# load the model from disk\n",
    "def prediction(df):\n",
    "    filename = 'temp_model.pkl'\n",
    "    loaded_model = joblib.load(filename)\n",
    "    return loaded_model.predict(df)\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.8.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
