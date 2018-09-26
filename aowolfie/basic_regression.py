from __future__ import absolute_import, division, print_function

import tensorflow as tf
from tensorflow import keras

import numpy as np
import pandas as pd


column_names = ['CRIM', 'ZN', 'INDUS', 'CHAS', 'NOX', 'RM', 'AGE', 'DIS', 'RAD',
                'TAX', 'PTRATIO', 'B', 'LSTAT']


import matplotlib.pyplot as plt

bostonHousing = keras.datasets.boston_housing

(trainData, trainLabels), (testData, testLabels) = bostonHousing.load_data()

order = np.argsort(np.random.random(trainLabels.shape))
trainData = trainData[order]
trainLabels = trainLabels[order]

mean = trainData.mean(axis=0)
std = trainData.std(axis=0)
trainData = (trainData - mean) / std
testData = (testData - mean) / std	


df = pd.DataFrame(trainData, columns=column_names)
print(df.head())

def buildModel():
	model = keras.Sequential([
		keras.layers.Dense(64, activation=tf.nn.relu, input_shape=(trainData.shape[1],)),
		keras.layers.Dense(64, activation=tf.nn.relu),
		keras.layers.Dense(1)
	])
	optimizer = tf.train.RMSPropOptimizer(0.001)

	model.compile(loss='mse', optimizer=optimizer, metrics=['mae'])
	return model
model = buildModel()
model.summary()

class PrintDot(keras.callbacks.Callback):
	def on_epoch_end(self, epoch, logs):
		if epoch % 100 == 0: print('')
		print('.', end='')
EPOCHS = 500

history = model.fit(trainData, trainLabels, epochs=EPOCHS, validation_split=0.2, verbose=0, callbacks=[PrintDot()])


def plot_history(history):
  plt.figure()
  plt.xlabel('Epoch')
  plt.ylabel('Mean Abs Error [1000$]')
  plt.plot(history.epoch, np.array(history.history['mean_absolute_error']),
           label='Train Loss')
  plt.plot(history.epoch, np.array(history.history['val_mean_absolute_error']),
           label = 'Val loss')
  plt.legend()
  plt.ylim([0, 5])
  plt.show()

#plot_history(history)

[loss, mae] = model.evaluate(testData, testLabels, verbose=0)

print("\nTesting set Mean Abs Error: ${:7.2f}".format(mae * 1000))

test_predictions = model.predict(testData).flatten()

plt.scatter(testLabels, test_predictions)
plt.xlabel('True Values [1000$]')
plt.ylabel('Predictions [1000$]')
plt.axis('equal')
plt.xlim(plt.xlim())
plt.ylim(plt.ylim())
_ = plt.plot([-100, 100], [-100, 100])
plt.show()

error = test_predictions - testLabels
plt.hist(error, bins = 50)
plt.xlabel("Prediction Error [1000$]")
_ = plt.ylabel("Count")
plt.show()