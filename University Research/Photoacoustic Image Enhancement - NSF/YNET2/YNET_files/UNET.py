"""
Created on Thu Mar 12 11:56:43 2020

@author: Matthew
"""

import cv2
import glob
import numpy as np

from keras.layers import concatenate
from keras.layers import Dropout
from keras.layers import Conv2D, MaxPooling2D, Conv2DTranspose
from keras.engine.input_layer import Input
import keras

from keras.preprocessing.image import ImageDataGenerator
import matplotlib.pyplot as plt


def keras_custom_loss_function(y_actual, y_predicted):
    custom_loss_value = keras.losses.mean_squared_error(y_actual, y_predicted) / (128 * 128)
    return custom_loss_value


def make_image_set(path):
    
    data = []
    files = glob.glob(path)
    
    for myFile in files:
        #print(myFile)
        image = cv2.imread(myFile).astype('float32')
        #print(image)
        image = cv2.resize(image, (128,128))
        print(image)

        data.append(image[:,:,0])
        
    np_data = np.array(data)
    
    return np_data


def build_model(input_layer, start_neurons):
    
    #print(input_layer.shape)
    conv1 = Conv2D(start_neurons * 1, (3, 3), activation="relu", padding="same")(input_layer)
    conv1 = Conv2D(start_neurons * 1, (3, 3), activation="relu", padding="same")(conv1)
    pool1 = MaxPooling2D((2, 2))(conv1)
    pool1 = Dropout(0.25)(pool1)
    


    conv2 = Conv2D(start_neurons * 2, (3, 3), activation="relu", padding="same")(pool1)
    conv2 = Conv2D(start_neurons * 2, (3, 3), activation="relu", padding="same")(conv2)
    pool2 = MaxPooling2D((2, 2))(conv2)
    pool2 = Dropout(0.5)(pool2)



    conv3 = Conv2D(start_neurons * 4, (3, 3), activation="relu", padding="same")(pool2)
    conv3 = Conv2D(start_neurons * 4, (3, 3), activation="relu", padding="same")(conv3)
    pool3 = MaxPooling2D((2, 2))(conv3)
    pool3 = Dropout(0.5)(pool3)



    conv4 = Conv2D(start_neurons * 8, (3, 3), activation="relu", padding="same")(pool3)
    conv4 = Conv2D(start_neurons * 8, (3, 3), activation="relu", padding="same")(conv4)
    pool4 = MaxPooling2D((2, 2))(conv4)
    pool4 = Dropout(0.5)(pool4)


    # Middle

    convm = Conv2D(start_neurons * 16, (3, 3), activation="relu", padding="same")(pool4)
    convm = Conv2D(start_neurons * 16, (3, 3), activation="relu", padding="same")(convm)

    

    deconv4 = Conv2DTranspose(start_neurons * 8, (3, 3), strides=(2, 2), padding="same")(convm)
    uconv4 = concatenate([deconv4, conv4])
    uconv4 = Dropout(0.5)(uconv4)
    uconv4 = Conv2D(start_neurons * 8, (3, 3), activation="relu", padding="same")(uconv4)
    uconv4 = Conv2D(start_neurons * 8, (3, 3), activation="relu", padding="same")(uconv4)



    deconv3 = Conv2DTranspose(start_neurons * 4, (3, 3), strides=(2, 2), padding="same")(uconv4)
    uconv3 = concatenate([deconv3, conv3])
    uconv3 = Dropout(0.5)(uconv3)
    uconv3 = Conv2D(start_neurons * 4, (3, 3), activation="relu", padding="same")(uconv3)
    uconv3 = Conv2D(start_neurons * 4, (3, 3), activation="relu", padding="same")(uconv3)


    deconv2 = Conv2DTranspose(start_neurons * 2, (3, 3), strides=(2, 2), padding="same")(uconv3)
    uconv2 = concatenate([deconv2, conv2])
    uconv2 = Dropout(0.5)(uconv2)
    uconv2 = Conv2D(start_neurons * 2, (3, 3), activation="relu", padding="same")(uconv2)
    uconv2 = Conv2D(start_neurons * 2, (3, 3), activation="relu", padding="same")(uconv2)

    deconv1 = Conv2DTranspose(start_neurons * 1, (3, 3), strides=(2, 2), padding="same")(uconv2)
    uconv1 = concatenate([deconv1, conv1])
    uconv1 = Dropout(0.5)(uconv1)
    uconv1 = Conv2D(start_neurons * 1, (3, 3), activation="relu", padding="same")(uconv1)
    uconv1 = Conv2D(start_neurons * 1, (3, 3), activation="relu", padding="same")(uconv1)

    output_layer = Conv2D(1, (1,1), padding="same", activation="sigmoid")(uconv1)


    return output_layer



input_layer = Input(shape=(128, 128, 1))
output_layer = build_model(input_layer, 16)


x_train_path = r"training/images/time_reversal_data/*.PNG"
x_test_path = r"test/images/time_reversal_data/*.PNG"
y_train_path = r"training/images/*.TIF"
y_test_path = r"test/images/*.TIF"

x_train = make_image_set(x_train_path)
x_test = make_image_set(x_test_path)
y_train = make_image_set(y_train_path)
y_test = make_image_set(y_test_path)

x_train = np.reshape(x_train, (28,128,128,1))
x_test = np.reshape(x_test, (12,128,128,1))

y_train = np.reshape(x_train, (28,128,128,1))
y_test = np.reshape(x_test, (12,128,128,1))

datagen = ImageDataGenerator(
    featurewise_center=True,
    featurewise_std_normalization=True,
    rotation_range=20,
    width_shift_range=0.2,
    height_shift_range=0.2,
    horizontal_flip=True,
    vertical_flip=True,
    fill_mode="wrap",
    rescale=4)

imageGen = datagen.flow(x_train, y_train, batch_size=8, shuffle=True)
#
datagen.fit(x_train)   


model = keras.Model(input_layer, output_layer)

#optimizer=keras.optimizers.Adadelta(lr=1000.0, rho=0.95)
#sgd = keras.optimizers.SGD(lr=0.5, decay=1e-6, momentum=0.9, nesterov=True)
sgd = keras.optimizers.SGD(lr=0.001, momentum=0.9, nesterov=True)
#print_weights = LambdaCallback(on_epoch_end=lambda batch, logs: print(model.layers[0].get_weights()))

model.compile(loss=keras_custom_loss_function,
          optimizer=sgd,
          metrics=['accuracy'])

history = model.fit_generator(imageGen, steps_per_epoch=len(x_train), epochs=200, validation_data=(x_test, y_test)) 

#history = model.fit(x=x_train, y=y_train, steps_per_epoch=len(x_train), validation_steps=len(x_test), epochs=3, validation_data=(x_test, y_test)) #, callbacks = [print_weights] 
#weights = model.get_weights()
#print(weights)

print(history.history.keys())

# summarize history for accuracy
plt.plot(history.history['acc'])
plt.plot(history.history['val_acc'])
plt.title('model accuracy')
plt.ylabel('accuracy')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()
# summarize history for loss
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('model loss')
plt.ylabel('loss')
plt.xlabel('epoch')
plt.legend(['train', 'test'], loc='upper left')
plt.show()

#model.fit(x_train, y_train, batch_size=20, epochs=12, verbose=1, validation_data=(x_test, y_test))

score = model.evaluate(x_test, y_test, verbose=0)

print('Test loss:', score[0])
print('Test accuracy:', score[1])




