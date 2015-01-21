#include <Adafruit_NeoPixel.h>

#define PIN 6

Adafruit_NeoPixel strip = Adafruit_NeoPixel(40, PIN, NEO_GRB + NEO_KHZ800);

void setup() {
  strip.begin();
  strip.show();
}

void setColor(uint8_t i, uint8_t b0, uint8_t b1) {
  strip.setPixelColor(i, strip.Color((b1 >> 2) & 31, ((b1 << 3)+(b0>>5)) & 31, b0 & 31));
}

void nextByte(uint8_t b) {
  static uint8_t i = 0;
  static uint8_t b0 = 0;
  static uint8_t b0_set = 0;
  
  if(!b0_set)
  {
    b0 = b;
    b0_set = 1;
    return;
  }
  
  if(b0 == 0xff && b == 0xff)
  {
    i = 0;
    b0_set = 0;
    return;
  }
  
  setColor(i, b0, b);

  b0_set = 0;
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

