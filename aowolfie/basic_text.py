import tensorflow as tf
from tensorflow import keras

import numpy as np
import matplotlib.pyplot as plt

imdb = keras.datasets.imdb

(trainData, trainLabels), (testData, testLabels) = imdb.load_data(num_words=1000)

print("Training entries: {}, labels: {}".format(len(trainData), len(trainLabels)))

wordIndex = imdb.get_word_index()

wordIndex = {k:(v+3) for k,v in wordIndex.items()}
wordIndex["<PAD>"] = 0
wordIndex["<START>"] = 1
wordIndex["UNK"] = 2
wordIndex["<UNUSED>"] = 3

reverseWordIndex = dict([(value, key) for (key, value) in wordIndex.items()])

def decode(text):
	return ' '.join([reverseWordIndex.get(i, "?") for i in text])

trainData = keras.preprocessing.sequence.pad_sequences(trainData, value=wordIndex["<PAD>"], padding='post', maxlen=256)

testData = keras.preprocessing.sequence.pad_sequences(testData, value=wordIndex["<PAD>"], padding='post', maxlen=256)

vocabSize = 10000

model = keras.Sequential()
model.add(keras.layers.Embedding(vocabSize, 16))
model.add(keras.layers.GlobalAveragePooling1D())
model.add(keras.layers.Dense(16, activation=tf.nn.relu))
model.add(keras.layers.Dense(1, activation=tf.nn.sigmoid))

model.summary()

model.compile(optimizer=tf.train.AdamOptimizer(), loss='binary_crossentropy', metrics=['accuracy'])

xVal = trainData[:10000]
pXTrain = trainData[10000:]

yVal = trainLabels[:10000]
pYTrain = trainLabels[10000:]

history = model.fit(pXTrain, pYTrain, epochs=40, batch_size=248, validation_data=(xVal, yVal), verbose=1)

results = model.evaluate(testData, testLabels)
print(results)

history_dict = history.history
history_dict.keys()

acc = history.history['acc']
val_acc = history.history['val_acc']
loss = history.history['loss']
val_loss = history.history['val_loss']

epochs = range(1, len(acc) + 1)

# "bo" is for "blue dot"
plt.plot(epochs, loss, 'bo', label='Training loss')
# b is for "solid blue line"
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()

plt.show()

plt.clf()   # clear figure
acc_values = history_dict['acc']
val_acc_values = history_dict['val_acc']

plt.plot(epochs, acc, 'bo', label='Training acc')
plt.plot(epochs, val_acc, 'b', label='Validation acc')
plt.title('Training and validation accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend()

plt.show()
