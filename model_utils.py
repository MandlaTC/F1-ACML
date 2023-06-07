from keras.models import Sequential
from keras.layers import Dense, LSTM
from tensorflow.keras.optimizers import SGD

# define base model
def create_model():
    model = Sequential()
    model.add(Dense(32, kernel_initializer='normal', input_dim=3, activation= "relu"))
    model.add(Dense(64, kernel_initializer='normal', activation= "relu"))
    model.add(Dense(32, kernel_initializer='normal', activation= "relu"))
    model.add(Dense(1))
    model.compile(loss= "mean_squared_error" , optimizer="adam", metrics=["mean_squared_error"])
    return model

