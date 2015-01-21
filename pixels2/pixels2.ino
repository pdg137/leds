#include <Adafruit_NeoPixel.h>

#define PIN 6

Adafruit_NeoPixel strip = Adafruit_NeoPixel(40, PIN, NEO_GRB + NEO_KHZ800);

void setup() {
  strip.begin();
  strip.show();
}

void nextByte(uint8_t b) {
  static uint8_t i = 0;
  static uint8_t b1 = 0;
  static uint8_t b1_set = 0;
  
  if(!b1_set)
  {
    b1 = b;
    b1_set = 1;
    return;
  }
  
  if(b1 == 0xff && b == 0xff)
  {
    i = 0;
    b1_set = 0;
    return;
  }
  
  strip.setPixelColor(i, strip.Color((b >> 2) & 31, ((b << 3)+(b1>>5)) & 31, b1 & 31));

  b1_set = 0;
  i ++;
  if(i == 40)
  {
    i = 0;
    strip.show();
  }
}

void loop() {
  if (Serial.available() > 0) {
    nextByte(Serial.read());
  }
}

