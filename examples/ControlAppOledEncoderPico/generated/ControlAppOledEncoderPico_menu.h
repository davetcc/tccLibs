/*
    The code in this file uses open source libraries provided by thecoderscorner

    DO NOT EDIT THIS FILE, IT WILL BE GENERATED EVERY TIME YOU USE THE UI DESIGNER
    INSTEAD EITHER PUT CODE IN YOUR SKETCH OR CREATE ANOTHER SOURCE FILE.

    All the variables you may need access to are marked extern in this file for easy
    use elsewhere.
 */

#ifndef MENU_GENERATED_CODE_H
#define MENU_GENERATED_CODE_H

#include <PlatformDetermination.h>
#include <tcMenu.h>

#include <tcUnicodeHelper.h>
#include "Adafruit_SSD1306.h"
#include "tcMenuAdaFruitGfxMono.h"
#include <IoAbstraction.h>
#include <EepromItemStorage.h>

// variables we declare that you may need to access
extern const PROGMEM ConnectorLocalInfo applicationInfo;
extern AdafruitSSD1306Spi* gfx;
extern AdafruitDrawable gfxDrawable;
extern GraphicsDeviceRenderer renderer;
extern const GFXfont Org_01;

// Any externals needed by IO expanders, EEPROMs etc


// Global Menu Item exports
extern FloatMenuItem menuA0Level;
extern EnumMenuItem menuState;
extern AnalogMenuItem menuRightVU;
extern AnalogMenuItem menuLeftVU;
extern BackMenuItem menuBackStatus;
extern SubMenuItem menuStatus;
extern BooleanMenuItem menuDirect;
extern BooleanMenuItem menuMute;
extern EnumMenuItem menuChannel;
extern AnalogMenuItem menuVolume;

// Provide a wrapper to get hold of the root menu item and export setupMenu
inline MenuItem& rootMenuItem() { return menuVolume; }
void setupMenu();

// Callback functions must always include CALLBACK_FUNCTION after the return type
#define CALLBACK_FUNCTION

void CALLBACK_FUNCTION onVolumeChanged(int id);

#endif // MENU_GENERATED_CODE_H
