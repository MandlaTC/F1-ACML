import matplotlib.pyplot as plt

def plot_loss(history):
  plt.plot(history.history['loss'])
  plt.plot(history.history['val_loss'])
  plt.title('model loss')
  plt.ylabel('loss')
  plt.xlabel('epoch')
  plt.legend(['train', 'test'], loc='upper left')
  plt.show()
# def plot_loss(history):
#   plt.plot(history.history['loss'], label='loss')
#   plt.plot(history.history['val_loss'], label='val_loss')
#   plt.ylim([0, 10])
#   plt.xlabel('Epoch')
#   plt.ylabel('Error')
#   plt.legend()
#   plt.grid(True)
#   plt.show()

def describe_training(x_train, y_train, x_test, y_test):
  train_size = len(x_train)
  test_size = len(x_test)

  print(f"Test Dataset Size: {test_size}")
  print(f"Train Dataset Size: {train_size}")