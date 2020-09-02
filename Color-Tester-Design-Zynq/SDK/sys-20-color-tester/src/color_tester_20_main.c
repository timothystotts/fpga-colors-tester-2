/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdlib.h>
#include <stdio.h>
#include "sleep.h"
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "PmodOLEDrgb.h"
#include "PmodKYPD.h"
#include "led_pwm.h"

/* Global constants */
// keytable is determined as follows (indices shown in Keypad position below)
// 12 13 14 15
// 8  9  10 11
// 4  5  6  7
// 0  1  2  3
#define DEFAULT_KEYTABLE "0FED789C456B123A"

#define USERIO_DEVICE_ID 0
#define SWTCHS_SWS_MASK 0x0F
#define SWTCH_SW_CHANNEL 1
#define SWTCH0_MASK 0x01
#define SWTCH1_MASK 0x02
#define SWTCH2_MASK 0x04
#define SWTCH3_MASK 0x08
#define BTNS_SWS_MASK 0x0F
#define BTNS_SW_CHANNEL 2
#define BTN0_MASK 0x01
#define BTN1_MASK 0x02
#define BTN2_MASK 0x04
#define BTN3_MASK 0x08

/* Global constants */
#define CAPTURED_STRING_LENGTH 11

/* Global types */
typedef struct T_EXPERIMENT_DATA_TAG
{
	/* Driver objects */
	XGpio axGpio;
	PmodOLEDrgb oledrgbDevice;
	PmodKYPD kypdDevice;
	/* LED driver palettes stored */
	t_rgb_led_palette_silk ledUpdate[8];
	/* GPIO reading values at this point in the execution */
	u32 switchesRead;
	u32 buttonsRead;
	u32 switchesReadPrev;
	u32 buttonsReadPrev;
	/* Captured keypad string */
	u8 capturedString[CAPTURED_STRING_LENGTH];
} t_experiment_data;

/* Function prototypes */
static void Experiment_OLEDInitialize(t_experiment_data* expData);
static void Experiment_KYPDInitialize(t_experiment_data* expData);
static void Experiment_LEDsInitialize(t_experiment_data* expData);
static void Experiment_UserIOInitialize(t_experiment_data* expData);
static void Experiment_PeripheralsInitialize(t_experiment_data* expData);
static void Experiment_SetLedUpdate(t_experiment_data* expData,
		uint8_t silk, uint8_t red, uint8_t green, uint8_t blue);

/* Global variables */
t_experiment_data experiData; // Global as that the object is always in scope, including interrupt handler.

/*-----------------------------------------------------------*/
/* Helper function to set an updated state to one of the 8 LEDs. */
static void Experiment_SetLedUpdate(t_experiment_data* expData,
		uint8_t silk, uint8_t red, uint8_t green, uint8_t blue)
{
	if (silk < 8) {
		expData->ledUpdate[silk].ledSilk = silk;
		expData->ledUpdate[silk].rgb.paletteRed = red;
		expData->ledUpdate[silk].rgb.paletteGreen = green;
		expData->ledUpdate[silk].rgb.paletteBlue = blue;
	}

	if (expData->ledUpdate[silk].ledSilk < 4) {
		if (expData->ledUpdate[silk].rgb.paletteGreen <= 100) {
			SetBasicLedPercent(expData->ledUpdate[silk].ledSilk, 10 * expData->ledUpdate[silk].rgb.paletteGreen);
		}
	} else if (expData->ledUpdate[silk].ledSilk < 5) {
		/* skip */
	} else if (expData->ledUpdate[silk].ledSilk <= 6) {
		SetRgbPaletteLed(expData->ledUpdate[silk].ledSilk, &(expData->ledUpdate[silk].rgb));
	}
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the OLEDrgb peripheral. */
void Experiment_OLEDInitialize(t_experiment_data* expData)
{
	OLEDrgb_begin(&(expData->oledrgbDevice), XPAR_PMODOLEDRGB_0_AXI_LITE_GPIO_BASEADDR,
	         XPAR_PMODOLEDRGB_0_AXI_LITE_SPI_BASEADDR);

	OLEDrgb_SetCursor(&(expData->oledrgbDevice), 0, 0);
	OLEDrgb_SetFontColor(&(expData->oledrgbDevice), OLEDrgb_BuildRGB(255, 255, 255)); // White font
	OLEDrgb_PutString(&(expData->oledrgbDevice), "Colors Test:");
	OLEDrgb_SetCursor(&(expData->oledrgbDevice), 0, 1);
	OLEDrgb_SetFontColor(&(expData->oledrgbDevice), OLEDrgb_BuildRGB(255, 255, 255)); // White font
	OLEDrgb_PutString(&(expData->oledrgbDevice), "for  compare");
	OLEDrgb_SetCursor(&(expData->oledrgbDevice), 0, 2);
	OLEDrgb_SetFontColor(&(expData->oledrgbDevice), OLEDrgb_BuildRGB(255, 255, 255)); // White font
	OLEDrgb_PutString(&(expData->oledrgbDevice), "  RGB   LEDs");
	OLEDrgb_SetCursor(&(expData->oledrgbDevice), 0, 3);
	OLEDrgb_SetFontColor(&(expData->oledrgbDevice), OLEDrgb_BuildRGB(255, 255, 255)); // White font
	OLEDrgb_PutString(&(expData->oledrgbDevice), "and OLEDrgb.");
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the KYPD peripheral. */
void Experiment_KYPDInitialize(t_experiment_data* expData)
{
	KYPD_begin(&(expData->kypdDevice), XPAR_PMODKYPD_0_AXI_LITE_GPIO_BASEADDR);
	KYPD_loadKeyTable(&(expData->kypdDevice), (u8*) DEFAULT_KEYTABLE);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the discrete board LEDs. */
void Experiment_LEDsInitialize(t_experiment_data* expData)
{
	InitAllLedsOff();
	for (int i = 0; i < 8; ++i)
		Experiment_SetLedUpdate(expData, i, 0, 0, 0);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize the input GPIO connected to board Switches and Buttons. */
void Experiment_UserIOInitialize(t_experiment_data* expData)
{
	XGpio_Initialize(&(expData->axGpio), USERIO_DEVICE_ID);
	XGpio_SelfTest(&(expData->axGpio));
	XGpio_SetDataDirection(&(expData->axGpio), SWTCH_SW_CHANNEL, SWTCHS_SWS_MASK);
	XGpio_SetDataDirection(&(expData->axGpio), BTNS_SW_CHANNEL, BTNS_SWS_MASK);
}

/*-----------------------------------------------------------*/
/* Helper function to initialize each peripheral */
void Experiment_PeripheralsInitialize(t_experiment_data* expData)
{
	Experiment_OLEDInitialize(expData);
	Experiment_KYPDInitialize(expData);
	Experiment_LEDsInitialize(expData);
	Experiment_UserIOInitialize(expData);
}

/*-----------------------------------------------------------*/
/* Helper function to capture user input on keypad */
void Experiment_CaptureStringFromKeypad(t_experiment_data* expData)
{
	u16 keystate;
	XStatus status = KYPD_NO_KEY;
	XStatus lastStatus = KYPD_NO_KEY;
	u8 key = 'x';
	u8 lastKey = 'x';
	u8 stringIdx = 0;

	Xil_Out32(expData->kypdDevice.GPIO_addr, 0xF);

	for(;;)
	{
		// Capture the state of each key
		keystate = KYPD_getKeyStates(&(expData->kypdDevice));

		// Determine which single key is pressed, if any
		status = KYPD_getKeyPressed(&(expData->kypdDevice), keystate, &key);

		// Capture new key if a new key is pressed or if status has changed
		if ((status == KYPD_SINGLE_KEY) &&
				((status != lastStatus) || (key != lastKey)))
		{
			xil_printf("Key Pressed: %c\r\n", (char)key);
			lastKey = key;

			// All sequences start with key press 'A'
			if (key == 'A')
			{
				stringIdx = 0;
			}

			if (stringIdx < CAPTURED_STRING_LENGTH)
			{
				expData->capturedString[stringIdx] = key;
				stringIdx++;
			}

			// All sequences are length \ref CAPTURED_STRING_LENGTH
			if (stringIdx == CAPTURED_STRING_LENGTH)
			{
				break;
			}
		}
		else if ((status == KYPD_MULTI_KEY) && (status != lastStatus))
		{
			xil_printf("Error: Multiple keys pressed\r\n");
		}

		lastStatus = status;

		usleep(1000);
	}
}

/*-----------------------------------------------------------*/
/* Main routine to perform color mixing. */
int main()
{
	const u8 INVALID_LED_SILK = 255;
	char ledChanValue[4] = {'0', '0', '0', '\0'};
	u8 rgbChanValues[3];
	u8 ledSilkIdx;
	char printBuf[16];
    init_platform();

    Experiment_PeripheralsInitialize(&experiData);

    for(;;)
    {
    	Experiment_CaptureStringFromKeypad(&experiData);

    	usleep(500000); /* Delay for human factors */

    	if (experiData.capturedString[0] == 'A')
    	{
			switch (experiData.capturedString[1])
			{
			case '5': ledSilkIdx = 5; break;
			case '6': ledSilkIdx = 6; break;
			default: ledSilkIdx = INVALID_LED_SILK; break;
			}

			if (ledSilkIdx != INVALID_LED_SILK)
			{
				ledChanValue[0] = experiData.capturedString[2];
				ledChanValue[1] = experiData.capturedString[3];
				ledChanValue[2] = experiData.capturedString[4];
				rgbChanValues[0] = atoi(ledChanValue);

				ledChanValue[0] = experiData.capturedString[5];
				ledChanValue[1] = experiData.capturedString[6];
				ledChanValue[2] = experiData.capturedString[7];
				rgbChanValues[1] = atoi(ledChanValue);

				ledChanValue[0] = experiData.capturedString[8];
				ledChanValue[1] = experiData.capturedString[9];
				ledChanValue[2] = experiData.capturedString[10];
				rgbChanValues[2] = atoi(ledChanValue);

				xil_printf("Testing RGB mix: %03hhu,%03hhu,%03hhu = 0x%02hhx%02hhx%02hhx\r\n",
						rgbChanValues[0], rgbChanValues[1], rgbChanValues[2],
						rgbChanValues[0], rgbChanValues[1], rgbChanValues[2]);

				Experiment_SetLedUpdate(&experiData, ledSilkIdx,
						rgbChanValues[0],
						rgbChanValues[1],
						rgbChanValues[2]);

				OLEDrgb_SetCursor(&(experiData.oledrgbDevice),
						0, 0+ledSilkIdx);
				OLEDrgb_SetFontColor(&(experiData.oledrgbDevice),
						OLEDrgb_BuildRGB( /* The old driver had a bug where RGB was endian swapped */
								rgbChanValues[0],
								rgbChanValues[1],
								rgbChanValues[2]));
				snprintf(printBuf, sizeof(printBuf),
						"Color LED%d  ", ledSilkIdx);
				OLEDrgb_PutString(&(experiData.oledrgbDevice), printBuf);
			}
    	}
    }

    cleanup_platform();
    return 0;
}