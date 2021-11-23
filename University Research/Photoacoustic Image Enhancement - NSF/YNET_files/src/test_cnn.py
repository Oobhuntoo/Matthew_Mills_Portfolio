# -*- coding: utf-8 -*-
"""
Created on Mon Feb 10 21:31:27 2020

@author: Matthew
"""

#https://towardsdatascience.com/build-your-own-convolution-neural-network-in-5-mins-4217c2cf964f 

import keras
from keras.datasets import mnist
from keras.models import Sequential
from keras.layers import Dense, Dropout, Flatten
from keras.layers import Conv2D, MaxPooling2D
import numpy as np

batch_size = 128
num_classes = 10
epochs = 12


# input image dimensions

img_rows, img_cols = 28, 28

# the data, split between train and test sets
# https://www.kaggle.com/phoenigs/u-net-dropout-augmentation-stratification

# convert each image to numpy array add to list, then convert list to numpy array

(x_train, y_train), (x_test, y_test) = mnist.load_data()


x_train = x_train.reshape(60000,28,28,1)
x_test = x_test.reshape(10000,28,28,1)


print('x_train shape:', x_train.shape)
print(x_train.shape[0], 'train samples')
print(x_test.shape[0], 'test samples')


# convert class vectors to binary class matrices

y_train = keras.utils.to_categorical(y_train, num_classes)
y_test = keras.utils.to_categorical(y_test, num_classes)


model = Sequential()
model.add(Conv2D(32, kernel_size=(3, 3),
                 activation='relu',
                 input_shape=(28,28,1)))

model.add(Conv2D(64, (3, 3), activation='relu'))
model.add(MaxPooling2D(pool_size=(2, 2)))
model.add(Dropout(0.25))
model.add(Flatten())
model.add(Dense(128, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(num_classes, activation='softmax'))


# replace with mean square error
model.compile(loss=keras.losses.categorical_crossentropy,
              optimizer=keras.optimizers.Adadelta(),
              metrics=['accuracy'])


model.fit(x_train, y_train,
          batch_size=batch_size,
          epochs=epochs,
          verbose=1,
          validation_data=(x_test, y_test))

score = model.evaluate(x_test, y_test, verbose=0)

print('Test loss:', score[0])
print('Test accuracy:', score[1])


""" OUPUT:
    Downloading data from https://s3.amazonaws.com/img-datasets/mnist.npz
11493376/11490434 [==============================] - 1s 0us/step
x_train shape: (60000, 28, 28, 1)
60000 train samples
10000 test samples
WARNING:tensorflow:From C:\ProgramData\Anaconda3\lib\site-packages\tensorflow\python\framework\op_def_library.py:263: colocate_with (from tensorflow.python.framework.ops) is deprecated and will be removed in a future version.
Instructions for updating:
Colocations handled automatically by placer.
WARNING:tensorflow:From C:\ProgramData\Anaconda3\lib\site-packages\keras\backend\tensorflow_backend.py:3445: calling dropout (from tensorflow.python.ops.nn_ops) with keep_prob is deprecated and will be removed in a future version.
Instructions for updating:
Please use `rate` instead of `keep_prob`. Rate should be set to `rate = 1 - keep_prob`.
WARNING:tensorflow:From C:\ProgramData\Anaconda3\lib\site-packages\tensorflow\python\ops\math_ops.py:3066: to_int32 (from tensorflow.python.ops.math_ops) is deprecated and will be removed in a future version.
Instructions for updating:
Use tf.cast instead.
Train on 60000 samples, validate on 10000 samples
Epoch 1/12
60000/60000 [==============================] - 99s 2ms/step - loss: 4.3617 - acc: 0.6787 - val_loss: 0.0766 - val_acc: 0.9758
Epoch 2/12
60000/60000 [==============================] - 109s 2ms/step - loss: 0.1442 - acc: 0.9588 - val_loss: 0.0595 - val_acc: 0.9838
Epoch 3/12
60000/60000 [==============================] - 155s 3ms/step - loss: 0.0936 - acc: 0.9742 - val_loss: 0.0441 - val_acc: 0.9861
Epoch 4/12
60000/60000 [==============================] - 112s 2ms/step - loss: 0.0737 - acc: 0.9790 - val_loss: 0.0383 - val_acc: 0.9876
Epoch 5/12
60000/60000 [==============================] - 112s 2ms/step - loss: 0.0639 - acc: 0.9810 - val_loss: 0.0385 - val_acc: 0.9893
Epoch 6/12
60000/60000 [==============================] - 110s 2ms/step - loss: 0.0519 - acc: 0.9851 - val_loss: 0.0409 - val_acc: 0.9879
Epoch 7/12
60000/60000 [==============================] - 111s 2ms/step - loss: 0.0473 - acc: 0.9863 - val_loss: 0.0329 - val_acc: 0.9890
Epoch 8/12
60000/60000 [==============================] - 109s 2ms/step - loss: 0.0427 - acc: 0.9877 - val_loss: 0.0377 - val_acc: 0.9898
Epoch 9/12
60000/60000 [==============================] - 109s 2ms/step - loss: 0.0408 - acc: 0.9878 - val_loss: 0.0420 - val_acc: 0.9894
Epoch 10/12
60000/60000 [==============================] - 107s 2ms/step - loss: 0.0365 - acc: 0.9892 - val_loss: 0.0366 - val_acc: 0.9897
Epoch 11/12
60000/60000 [==============================] - 109s 2ms/step - loss: 0.0360 - acc: 0.9899 - val_loss: 0.0323 - val_acc: 0.9908
Epoch 12/12
60000/60000 [==============================] - 127s 2ms/step - loss: 0.0347 - acc: 0.9905 - val_loss: 0.0559 - val_acc: 0.9875
Test loss: 0.05593148862336061
Test accuracy: 0.9875"""