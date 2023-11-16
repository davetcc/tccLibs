## The Coders Corner libraries

Dave Cherry / TheCodersCorner.com made this library available for you to use. It takes me significant effort to keep all my libraries current and working on a wide range of boards. Please consider making at least a one off donation via the sponsor button if you find it useful. In forks, please keep text to here intact.

These libraries provide several useful extensions that make programming embedded apps for non-trivial apps simpler. There are many different practical and familiar examples packaged with it in the `examples` folder. Below I cover each of the main functions briefly with a link to more detailed documentation. The API is almost identical between any selected board making it easier to port between the two.

### License:

* AdaFruit Fork - MIT license (included in that directory)
* All other libraries - Apache license.

## How to use these libraries

All the coders corner libraries as a CMake artifact usable directly by Pico SDK. These are now the main source for most of our libraries, and the arduino libs are built using the script [copyOverLibs.sh in the z_scripts folder](z_scripts%2FcopyOverLibs.sh).

### Using in Arduino and PlatformIO

Simply use library manager in either Arduino or PlatformIO. The libraries are directly available from there.

We support most Arduino variants (as many as we can in fact), and I'm not aware of a single board that it doesn't work on. However, if you find an issue please raise it, and we'll aim to fix it if at all possible.

This mono-repo is now the main source for library development. The libraries are readily available for Arduino and there are read-only repos for each library available in Arduino library manager. We need this additional repos because Arduino requires a repository per library. The Arduino library repos are as follows:

* https://github.com/davetcc/TaskManagerIO
* https://github.com/davetcc/tcMenuLib
* https://github.com/davetcc/IoAbstraction
* https://github.com/davetcc/tcUnicodeHelper
* https://github.com/davetcc/SimpleCollections
* https://github.com/davetcc/LiquidCrystalIO

### Using in PicoSDK

As per all other PicoSDK applications, you need to set up the environment variables and ensure these libraries are available in the path. For the initial MVP we assume you have a local to project copy of these libraries similar to how the examples folder works, we'll sort this out properly after 4.2 and mobile app is released.

### Using in mbed

We are in a transitional phase for mbed, at the moment it works fine via platformio, but soon we'll support it directly with CMake as well.

---

## Adafruit GFX fork special notes

The original readme is available here [Adafruit_GFX Fork README.md](AdafruitGFXNativePort%2FREADME.md) along with the [license.txt](AdafruitGFXNativePort%2Flicense.txt). Note that this directory is licensed differently to the rest of the package under the MIT license.

# Current state of play for direct pico-sdk / outside Arduino use

## Working

* IoAbstraction rotary encoders and switches without interrupts
* Wire I2C interface with IoAbstraction for PicoSDK
* SPI interface within IoAbstraction for PicoSDK
* TaskManagerIO fully working with PicoSDK
* SimpleCollections fully working with PicoSDK
* SCCircular buffer tested with interrupts on PicoSDK.
* Unicode helper library fully working with PicoSDK
* Liquid Crystal including I2C backpack is working
* SPI Wrapper is working
* Adafruit Fork I2C OLED working with PicoSDK
* SPI Adafruit fork test with PicoSDK
* PWM and Analog Input are working properly.
 
## To Test

* Check that AT24 EEPROMs are working properly.
* The copy script and setup of the libraries.

## Todo short term

* Test rotary encoders and switches with interrupts not working on PicoSDK
* Test rotary encoders/switches/LCD on other than 8574 IoExpanders and with interrupts.
* USB remote support for PicoSDK
* WiFi/LwIP remote support for PicoSDK
* ESP IDF CMake support
* Stm32Cube CMake support
* mbed CMake support
* Adafruit Fork I2C/SPI retest with mbed.
* Better way to create fonts
