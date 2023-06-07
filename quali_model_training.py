import numpy as np

from keras.models import Sequential
from keras.layers import Dense
from keras.wrappers.scikit_learn import KerasRegressor

from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error

from model_utils import create_model
from data_proccessing import create_training_data, convert_milliseconds_to_seconds
from training_utils import plot_loss, describe_training

training_data, target_data = create_training_data()

X_train, X_test, y_train, y_test = train_test_split(training_data, target_data, test_size=0.10, random_state=40)

describe_training(X_train, y_train, X_test, y_test)

model = create_model()

history = model.fit(X_train, y_train, validation_split = 0.20, verbose=1, epochs=20 )
pred = model.predict(X_test)
print('MSE in Seconds: ' + str( convert_milliseconds_to_seconds(np.sqrt(mean_squared_error(y_test,pred)))))
plot_loss(history)

# pred_train= model.predict(X_train)
# print(np.sqrt(mean_squared_error(y_train,pred_train)))


# for i in range (10):
#     print(convert_milliseconds_to_seconds(pred[i]))
#     print(convert_milliseconds_to_seconds(y_test[i]))
#     print()