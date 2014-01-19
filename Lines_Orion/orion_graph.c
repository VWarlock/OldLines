#include <orion_graph.h>
#include <mem.h>

uchar color = 0x0F;

uchar chargen[1] = {
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1E, 0x21, 0x33, 0x21, 0x2D, 0x21, 0x1E,
  0x00, 0x1E, 0x3F, 0x2D, 0x3F, 0x33, 0x3F, 0x1E, 0x00, 0x00, 0x00, 0x0A, 0x1F, 0x1F, 0x0E, 0x04,
  0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x0E, 0x04, 0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x04, 0x0E,
  0x00, 0x00, 0x00, 0x04, 0x0E, 0x1F, 0x0E, 0x1F, 0x00, 0x00, 0x0C, 0x1E, 0x1E, 0x0C, 0x00, 0x00,
  0x3F, 0x3F, 0x33, 0x21, 0x21, 0x33, 0x3F, 0x3F, 0x00, 0x00, 0x0C, 0x12, 0x12, 0x0C, 0x00, 0x00,
  0x3F, 0x3F, 0x33, 0x2D, 0x2D, 0x33, 0x3F, 0x3F, 0x00, 0x00, 0x07, 0x03, 0x1D, 0x24, 0x24, 0x18,
  0x00, 0x0E, 0x11, 0x11, 0x0E, 0x04, 0x1F, 0x04, 0x00, 0x1E, 0x12, 0x1E, 0x10, 0x10, 0x30, 0x30,
  0x00, 0x1F, 0x11, 0x1F, 0x11, 0x11, 0x33, 0x33, 0x0C, 0x2D, 0x0C, 0x33, 0x33, 0x0C, 0x2D, 0x0C,
  0x00, 0x30, 0x3C, 0x3F, 0x3F, 0x3C, 0x30, 0x00, 0x00, 0x03, 0x0F, 0x3F, 0x3F, 0x0F, 0x03, 0x00,
  0x04, 0x0E, 0x1F, 0x04, 0x1F, 0x0E, 0x04, 0x00, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x00, 0x0A, 0x00,
  0x00, 0x1F, 0x29, 0x19, 0x09, 0x09, 0x09, 0x00, 0x0E, 0x10, 0x0C, 0x12, 0x12, 0x0C, 0x02, 0x1C,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x1F, 0x00, 0x04, 0x0E, 0x1F, 0x04, 0x1F, 0x0E, 0x04, 0x1F,
  0x04, 0x0E, 0x1F, 0x04, 0x04, 0x04, 0x04, 0x00, 0x04, 0x04, 0x04, 0x04, 0x1F, 0x0E, 0x04, 0x00,
  0x00, 0x04, 0x02, 0x1F, 0x02, 0x04, 0x00, 0x00, 0x00, 0x04, 0x08, 0x1F, 0x08, 0x04, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x10, 0x10, 0x1F, 0x00, 0x00, 0x12, 0x33, 0x3F, 0x3F, 0x33, 0x12, 0x00,
  0x00, 0x0C, 0x1E, 0x3F, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x3F, 0x1E, 0x0C, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x04, 0x00,
  0x0A, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x1F, 0x0A, 0x1F, 0x0A, 0x0A, 0x00,
  0x04, 0x0F, 0x14, 0x0E, 0x05, 0x1E, 0x04, 0x00, 0x18, 0x19, 0x02, 0x04, 0x08, 0x13, 0x03, 0x00,
  0x04, 0x0A, 0x0A, 0x0C, 0x15, 0x12, 0x0D, 0x00, 0x06, 0x06, 0x02, 0x04, 0x00, 0x00, 0x00, 0x00,
  0x02, 0x04, 0x08, 0x08, 0x08, 0x04, 0x02, 0x00, 0x08, 0x04, 0x02, 0x02, 0x02, 0x04, 0x08, 0x00,
  0x00, 0x04, 0x15, 0x0E, 0x15, 0x04, 0x00, 0x00, 0x00, 0x04, 0x04, 0x1F, 0x04, 0x04, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x0C, 0x0C, 0x04, 0x08, 0x00, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x01, 0x02, 0x04, 0x08, 0x10, 0x00, 0x00,
  0x0E, 0x11, 0x13, 0x15, 0x19, 0x11, 0x0E, 0x00, 0x04, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00,
  0x0E, 0x11, 0x01, 0x06, 0x08, 0x10, 0x1F, 0x00, 0x1F, 0x01, 0x02, 0x06, 0x01, 0x11, 0x0E, 0x00,
  0x02, 0x06, 0x0A, 0x12, 0x1F, 0x02, 0x02, 0x00, 0x1F, 0x10, 0x1E, 0x01, 0x01, 0x11, 0x0E, 0x00,
  0x07, 0x08, 0x10, 0x1E, 0x11, 0x11, 0x0E, 0x00, 0x1F, 0x01, 0x02, 0x04, 0x08, 0x08, 0x08, 0x00,
  0x0E, 0x11, 0x11, 0x0E, 0x11, 0x11, 0x0E, 0x00, 0x0E, 0x11, 0x11, 0x0F, 0x01, 0x02, 0x1C, 0x00,
  0x00, 0x0C, 0x0C, 0x00, 0x00, 0x0C, 0x0C, 0x00, 0x0C, 0x0C, 0x00, 0x0C, 0x0C, 0x04, 0x08, 0x00,
  0x02, 0x04, 0x08, 0x10, 0x08, 0x04, 0x02, 0x00, 0x00, 0x00, 0x1F, 0x00, 0x1F, 0x00, 0x00, 0x00,
  0x08, 0x04, 0x02, 0x01, 0x02, 0x04, 0x08, 0x00, 0x0E, 0x11, 0x01, 0x02, 0x04, 0x00, 0x04, 0x00,
  0x0E, 0x11, 0x13, 0x15, 0x17, 0x10, 0x0E, 0x00, 0x04, 0x0A, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x00,
  0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E, 0x00, 0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E, 0x00,
  0x1E, 0x09, 0x09, 0x09, 0x09, 0x09, 0x1E, 0x00, 0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F, 0x00,
  0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x10, 0x00, 0x0E, 0x11, 0x10, 0x10, 0x13, 0x11, 0x0F, 0x00,
  0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11, 0x00, 0x0E, 0x04, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00,
  0x01, 0x01, 0x01, 0x01, 0x11, 0x11, 0x0E, 0x00, 0x11, 0x12, 0x14, 0x18, 0x14, 0x12, 0x11, 0x00,
  0x10, 0x10, 0x10, 0x10, 0x10, 0x11, 0x1F, 0x00, 0x11, 0x1B, 0x15, 0x15, 0x11, 0x11, 0x11, 0x00,
  0x11, 0x11, 0x19, 0x15, 0x13, 0x11, 0x11, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00,
  0x1E, 0x11, 0x11, 0x1E, 0x10, 0x10, 0x10, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x15, 0x12, 0x0D, 0x00,
  0x1E, 0x11, 0x11, 0x1E, 0x14, 0x12, 0x11, 0x00, 0x0E, 0x11, 0x10, 0x0E, 0x01, 0x11, 0x0E, 0x00,
  0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00,
  0x11, 0x11, 0x11, 0x0A, 0x0A, 0x04, 0x04, 0x00, 0x11, 0x11, 0x11, 0x15, 0x15, 0x15, 0x0A, 0x00,
  0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11, 0x00, 0x11, 0x11, 0x0A, 0x04, 0x04, 0x04, 0x04, 0x00,
  0x1F, 0x01, 0x02, 0x0E, 0x08, 0x10, 0x1F, 0x00, 0x0E, 0x08, 0x08, 0x08, 0x08, 0x08, 0x0E, 0x00,
  0x00, 0x10, 0x08, 0x04, 0x02, 0x01, 0x00, 0x00, 0x0E, 0x02, 0x02, 0x02, 0x02, 0x02, 0x0E, 0x00,
  0x0E, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x1F,
  0x18, 0x18, 0x10, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0E, 0x12, 0x12, 0x12, 0x0D, 0x00,
  0x00, 0x18, 0x08, 0x0E, 0x09, 0x09, 0x16, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x10, 0x11, 0x0E, 0x00,
  0x00, 0x06, 0x02, 0x0E, 0x12, 0x12, 0x0D, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x1F, 0x10, 0x0F, 0x00,
  0x00, 0x03, 0x04, 0x0E, 0x04, 0x04, 0x0E, 0x00, 0x00, 0x00, 0x0D, 0x12, 0x12, 0x0E, 0x02, 0x1C,
  0x00, 0x18, 0x08, 0x0E, 0x09, 0x09, 0x19, 0x00, 0x00, 0x08, 0x00, 0x08, 0x08, 0x08, 0x06, 0x00,
  0x00, 0x02, 0x00, 0x02, 0x02, 0x12, 0x0C, 0x00, 0x00, 0x18, 0x08, 0x0B, 0x0C, 0x0A, 0x19, 0x00,
  0x00, 0x0C, 0x04, 0x04, 0x04, 0x04, 0x0E, 0x00, 0x00, 0x00, 0x1A, 0x15, 0x15, 0x15, 0x15, 0x00,
  0x00, 0x00, 0x1C, 0x12, 0x12, 0x12, 0x12, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x0E, 0x00,
  0x00, 0x00, 0x16, 0x09, 0x09, 0x0E, 0x08, 0x18, 0x00, 0x00, 0x0D, 0x12, 0x12, 0x0E, 0x02, 0x03,
  0x00, 0x00, 0x16, 0x09, 0x08, 0x08, 0x1C, 0x00, 0x00, 0x00, 0x0E, 0x10, 0x0E, 0x01, 0x1E, 0x00,
  0x00, 0x08, 0x1C, 0x08, 0x08, 0x08, 0x06, 0x00, 0x00, 0x00, 0x12, 0x12, 0x12, 0x12, 0x0D, 0x00,
  0x00, 0x00, 0x11, 0x11, 0x11, 0x0A, 0x04, 0x00, 0x00, 0x00, 0x11, 0x15, 0x15, 0x15, 0x0A, 0x00,
  0x00, 0x00, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x00, 0x00, 0x00, 0x11, 0x11, 0x0F, 0x01, 0x1E, 0x00,
  0x00, 0x00, 0x1F, 0x12, 0x04, 0x09, 0x1F, 0x00, 0x03, 0x04, 0x04, 0x08, 0x04, 0x04, 0x03, 0x00,
  0x00, 0x04, 0x04, 0x00, 0x00, 0x04, 0x04, 0x00, 0x18, 0x04, 0x04, 0x02, 0x04, 0x04, 0x18, 0x00,
  0x0A, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x0A, 0x11, 0x11, 0x1F, 0x00,
  0x04, 0x0A, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x00, 0x1F, 0x10, 0x10, 0x1E, 0x11, 0x11, 0x1E, 0x00,
  0x1E, 0x11, 0x11, 0x1E, 0x11, 0x11, 0x1E, 0x00, 0x1F, 0x11, 0x10, 0x10, 0x10, 0x10, 0x10, 0x00,
  0x06, 0x0A, 0x0A, 0x0A, 0x0A, 0x1F, 0x11, 0x00, 0x1F, 0x10, 0x10, 0x1E, 0x10, 0x10, 0x1F, 0x00,
  0x11, 0x15, 0x15, 0x0E, 0x15, 0x15, 0x11, 0x00, 0x0E, 0x11, 0x01, 0x06, 0x01, 0x11, 0x0E, 0x00,
  0x11, 0x11, 0x13, 0x15, 0x19, 0x11, 0x11, 0x00, 0x15, 0x11, 0x13, 0x15, 0x19, 0x11, 0x11, 0x00,
  0x11, 0x12, 0x14, 0x18, 0x14, 0x12, 0x11, 0x00, 0x07, 0x09, 0x09, 0x09, 0x09, 0x09, 0x19, 0x00,
  0x11, 0x1B, 0x15, 0x15, 0x11, 0x11, 0x11, 0x00, 0x11, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x11, 0x00,
  0x0E, 0x11, 0x11, 0x11, 0x11, 0x11, 0x0E, 0x00, 0x1F, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x00,
  0x1E, 0x11, 0x11, 0x1E, 0x10, 0x10, 0x10, 0x00, 0x0E, 0x11, 0x10, 0x10, 0x10, 0x11, 0x0E, 0x00,
  0x1F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x00, 0x11, 0x11, 0x11, 0x0A, 0x04, 0x08, 0x10, 0x00,
  0x04, 0x1F, 0x15, 0x15, 0x1F, 0x04, 0x04, 0x00, 0x11, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x11, 0x00,
  0x12, 0x12, 0x12, 0x12, 0x12, 0x1F, 0x01, 0x00, 0x11, 0x11, 0x11, 0x1F, 0x01, 0x01, 0x01, 0x00,
  0x11, 0x15, 0x15, 0x15, 0x15, 0x15, 0x1F, 0x00, 0x15, 0x15, 0x15, 0x15, 0x15, 0x1F, 0x01, 0x00,
  0x18, 0x08, 0x08, 0x0E, 0x09, 0x09, 0x0E, 0x00, 0x11, 0x11, 0x11, 0x19, 0x15, 0x15, 0x19, 0x00,
  0x10, 0x10, 0x10, 0x1E, 0x11, 0x11, 0x1E, 0x00, 0x0E, 0x11, 0x01, 0x07, 0x01, 0x11, 0x0E, 0x00,
  0x12, 0x15, 0x15, 0x1D, 0x15, 0x15, 0x12, 0x00, 0x0F, 0x11, 0x11, 0x0F, 0x05, 0x09, 0x11, 0x00,
  0x00, 0x00, 0x0C, 0x02, 0x0E, 0x12, 0x0D, 0x00, 0x01, 0x0E, 0x18, 0x1E, 0x11, 0x11, 0x0E, 0x00,
  0x00, 0x00, 0x1C, 0x12, 0x1E, 0x11, 0x1E, 0x00, 0x00, 0x00, 0x1F, 0x10, 0x10, 0x10, 0x10, 0x00,
  0x00, 0x00, 0x06, 0x0A, 0x0A, 0x1F, 0x11, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x1F, 0x10, 0x0F, 0x00,
  0x00, 0x00, 0x15, 0x15, 0x0E, 0x15, 0x15, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x06, 0x11, 0x0E, 0x00,
  0x00, 0x00, 0x11, 0x13, 0x15, 0x19, 0x11, 0x00, 0x00, 0x04, 0x11, 0x13, 0x15, 0x19, 0x11, 0x00,
  0x00, 0x00, 0x11, 0x12, 0x1C, 0x12, 0x11, 0x00, 0x00, 0x00, 0x07, 0x09, 0x09, 0x09, 0x19, 0x00,
  0x00, 0x00, 0x11, 0x1B, 0x15, 0x11, 0x11, 0x00, 0x00, 0x00, 0x11, 0x11, 0x1F, 0x11, 0x11, 0x00,
  0x00, 0x00, 0x0E, 0x11, 0x11, 0x11, 0x0E, 0x00, 0x00, 0x00, 0x1F, 0x11, 0x11, 0x11, 0x11, 0x00,
  0x11, 0x04, 0x11, 0x04, 0x11, 0x04, 0x11, 0x04, 0x15, 0x2A, 0x15, 0x2A, 0x15, 0x2A, 0x15, 0x2A,
  0x2E, 0x3B, 0x2E, 0x3B, 0x2E, 0x3B, 0x2E, 0x3B, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
  0x04, 0x04, 0x04, 0x3C, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x3C, 0x04, 0x3C, 0x04, 0x04, 0x04,
  0x0A, 0x0A, 0x0A, 0x3A, 0x0A, 0x0A, 0x0A, 0x0A, 0x00, 0x00, 0x00, 0x3F, 0x0A, 0x0A, 0x0A, 0x0A,
  0x00, 0x00, 0x3C, 0x04, 0x3C, 0x04, 0x04, 0x04, 0x0A, 0x0A, 0x3A, 0x02, 0x3A, 0x0A, 0x0A, 0x0A,
  0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x00, 0x00, 0x3E, 0x02, 0x3A, 0x0A, 0x0A, 0x0A,
  0x0A, 0x0A, 0x3A, 0x02, 0x3E, 0x00, 0x00, 0x00, 0x0A, 0x0A, 0x0A, 0x3E, 0x00, 0x00, 0x00, 0x00,
  0x04, 0x04, 0x3C, 0x04, 0x3C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3C, 0x04, 0x04, 0x04, 0x04,
  0x04, 0x04, 0x04, 0x07, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x3F, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x3F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x07, 0x04, 0x04, 0x04, 0x04,
  0x00, 0x00, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x04, 0x04, 0x04, 0x3F, 0x04, 0x04, 0x04, 0x04,
  0x00, 0x00, 0x07, 0x04, 0x07, 0x04, 0x04, 0x04, 0x0A, 0x0A, 0x0A, 0x0B, 0x0A, 0x0A, 0x0A, 0x0A,
  0x0A, 0x0A, 0x0B, 0x08, 0x0F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0F, 0x08, 0x0B, 0x0A, 0x0A, 0x0A,
  0x0A, 0x0A, 0x3B, 0x00, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x3B, 0x0A, 0x0A, 0x0A,
  0x0A, 0x0A, 0x0B, 0x08, 0x0B, 0x0A, 0x0A, 0x0A, 0x00, 0x00, 0x3F, 0x00, 0x3F, 0x00, 0x00, 0x00,
  0x0A, 0x0A, 0x3B, 0x00, 0x3B, 0x0A, 0x0A, 0x0A, 0x04, 0x04, 0x3F, 0x00, 0x3F, 0x00, 0x00, 0x00,
  0x0A, 0x0A, 0x0A, 0x3F, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x3F, 0x00, 0x3F, 0x04, 0x04, 0x04,
  0x00, 0x00, 0x00, 0x3F, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0F, 0x00, 0x00, 0x00, 0x00,
  0x04, 0x04, 0x07, 0x04, 0x07, 0x00, 0x00, 0x00, 0x00, 0x00, 0x07, 0x04, 0x07, 0x04, 0x04, 0x04,
  0x00, 0x00, 0x00, 0x0F, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x0A, 0x3F, 0x0A, 0x0A, 0x0A, 0x0A,
  0x04, 0x04, 0x3F, 0x04, 0x3F, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x3C, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x00, 0x07, 0x04, 0x04, 0x04, 0x04, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F,
  0x00, 0x00, 0x00, 0x00, 0x3F, 0x3F, 0x3F, 0x3F, 0x38, 0x38, 0x38, 0x38, 0x38, 0x38, 0x38, 0x38,
  0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x3F, 0x3F, 0x3F, 0x3F, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x1E, 0x11, 0x1E, 0x10, 0x10, 0x00, 0x00, 0x00, 0x0E, 0x11, 0x10, 0x11, 0x0E, 0x00,
  0x00, 0x00, 0x1F, 0x04, 0x04, 0x04, 0x04, 0x00, 0x00, 0x00, 0x11, 0x11, 0x0F, 0x01, 0x1E, 0x00,
  0x00, 0x04, 0x0E, 0x15, 0x0E, 0x04, 0x04, 0x00, 0x00, 0x00, 0x11, 0x0A, 0x04, 0x0A, 0x11, 0x00,
  0x00, 0x00, 0x12, 0x12, 0x12, 0x1F, 0x01, 0x00, 0x00, 0x00, 0x11, 0x11, 0x0F, 0x01, 0x01, 0x00,
  0x00, 0x00, 0x15, 0x15, 0x15, 0x15, 0x1F, 0x00, 0x00, 0x00, 0x15, 0x15, 0x15, 0x1F, 0x01, 0x00,
  0x00, 0x00, 0x18, 0x08, 0x0E, 0x09, 0x0E, 0x00, 0x00, 0x00, 0x11, 0x11, 0x1D, 0x15, 0x1D, 0x00,
  0x00, 0x00, 0x10, 0x10, 0x1E, 0x11, 0x1E, 0x00, 0x00, 0x00, 0x1E, 0x01, 0x0F, 0x01, 0x1E, 0x00,
  0x00, 0x00, 0x12, 0x15, 0x1D, 0x15, 0x12, 0x00, 0x00, 0x00, 0x0F, 0x11, 0x0F, 0x09, 0x11, 0x00,
  0x0A, 0x00, 0x1F, 0x10, 0x1E, 0x10, 0x1F, 0x00, 0x0A, 0x00, 0x0E, 0x11, 0x1F, 0x10, 0x0F, 0x00,
  0x0C, 0x12, 0x04, 0x08, 0x1E, 0x00, 0x00, 0x00, 0x0C, 0x12, 0x04, 0x12, 0x0C, 0x00, 0x00, 0x00,
  0x04, 0x0C, 0x14, 0x1E, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x0C, 0x0C, 0x00, 0x3F, 0x00, 0x0C, 0x0C, 0x00, 0x00, 0x0A, 0x14, 0x00, 0x0A, 0x14, 0x00, 0x00,
  0x00, 0x08, 0x14, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0C, 0x00, 0x00, 0x00,
  0x1C, 0x1C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x02, 0x02, 0x24, 0x14, 0x08, 0x00,
  0x03, 0x03, 0x24, 0x34, 0x2C, 0x24, 0x24, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
  0x00, 0x1E, 0x1E, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

void print_p1(uchar*,uchar*) {
  asm {
    XCHG
    LHLD print_p1_1
    PUSH B
    MVI C, 8
print1_l:
    LDAX D
print_mode1A:
    NOP
    ADD A
    ADD A
    MOV B, A
    MOV A, M
print_mode1:
    ANI 3
    XRA B
    MOV M, A

    INX D
    INX H
    DCR C
    JNZ print1_l
    POP B
  }
}

void print_p2(uchar*,uchar*) {
  asm {
    XCHG
    LHLD print_p2_1
    PUSH B
    MVI C, 8
print2_l:
    LDAX D    
print_mode2A:
    NOP
    ADD A
    ADC A
    ADC A
    ADC A
    PUSH PSW
    ADC A
    ANI 00000011b
    MOV B, A
    MOV A, M
print_mode2:
    ANI 0FCh
    XRA B
    MOV M, A

    INR H

    POP PSW
    ANI 011110000b
    MOV B, A
    MOV A, M
print_mode3:
    ANI 00Fh
    XRA B
    MOV M, A

    DCR H

    INX D
    INX H
    DCR C
    JNZ print2_l

    POP B
  }
}

void print_p3(uchar*,uchar*) {
  asm {
    XCHG
    LHLD print_p3_1
    PUSH B
    MVI C, 8
print3_l:
    LDAX D    
print_mode3A:
    NOP
    RAR
    RAR
    ANI 00001111b
    MOV B, A
    MOV A, M
print_mode4:
    ANI 0F0h
    XRA B
    MOV M, A

    INR H

    LDAX D    
print_mode4A:
    NOP
    RAR
    RAR
    RAR
    ANI 11000000b
    MOV B, A
    MOV A, M
print_mode5:
    ANI 03Fh
    XRA B
    MOV M, A

    DCR H

    INX D
    INX H
    DCR C
    JNZ print3_l

    POP B
  }
}

void print_p4(uchar*,uchar*) {
  asm {
    XCHG
    LHLD print_p4_1
    PUSH B
    MVI C, 8
print4_l:
    LDAX D    
print_mode5A:
    NOP
    ANI 03Fh
    MOV B, A
    MOV A, M
print_mode6:
    ANI 0C0h
    XRA B
    MOV M, A
    INX D
    INX H
    DCR C
    JNZ print4_l
    POP B
  }
}

void print1(uchar* d, uchar st, uchar n, char* text) {
  uchar* s;
  uchar c, e;
  e = n&0x80; n&=0x7F;
  while(1) { 
    if(n == 0) return;     
    c = *text;
    if(c) ++text; else if(!e) return;
    s = chargen + c*8;
    switch(st) {
      case 0: print_p1(d, s); ++st; break;
      case 1: print_p2(d, s); ++st; d += 0x100; break;
      case 2: print_p3(d, s); ++st; d += 0x100; break;
      case 3: print_p4(d, s); st=0; d += 0x100; break;
    }  
    --n;
  }
}

void print(uchar x, uchar y, uchar n, char* text) {
  print1(PRINTARGS(x, y), n, text);
}

void himem() {
  // �����㥬 �㭪�� �뢮�� ��䨪� � ����ﭭ�� ������.
  asm {
    lxi h, bitBlt
    lxi d, 0F000h
initSpec:
    mov a, m
    inx h
    stax d
    inr e
    jnz initSpec
  }
}

// HIMEM

void bitBlt(uchar* d, uchar* s, uint wh) {
  asm {
    jmp bitBlt_himem - bitBlt + 0F000h
bitBlt_himem:
    push b
    ; lhld bitBlt_3
    mov b, h
    mov c, l
    lhld bitBlt_1
    xchg    
    lhld bitBlt_2
bitBlt_l1:
    push d
    push b                        
bitBlt_l2:
    mov b, m
    inx h
    mvi a, 1
    sta 0F900H
    mov a, b
    stax d
    xra a
    sta 0F900H
    mov a, m
    inx h
    stax d
    inx d    
    dcr c
    jnz bitBlt_l2 - bitBlt + 0F000h
    pop b
    pop d    
    inr d
    dcr b
    jnz bitBlt_l1 - bitBlt + 0F000h    
    pop b
    ret
  }
}

void colorizer_rand() {
  asm {
    jmp colorizer_himem - bitBlt + 0F000h
colorizer_himem:
    push b
    mvi  b, 0
    mvi  c, 48 
colorizerr_1:
    call rand
    
    mvi  d, 80h
    mov  e, a
    mvi  h, 0C0h
    mov  l, a
         
    push b 
colorizerr_2:
    ldax d
    inr  d
    mov  b, a

    mvi a, 1
    sta 0F900H
    mov  m, b
    inr  h    
    xra a
    sta 0F900H

    dcr  c
    jnz  colorizerr_2 - bitBlt + 0F000h
    pop  b

    dcr  b
    jnz  colorizerr_1 - bitBlt + 0F000h
    pop  b
    ret
  }
}

void bitBlt_bw(uchar* d, uchar* s, uint wh) {
  asm {
    jmp bitBlt_bw_himem - bitBlt + 0F000h
bitBlt_bw_himem:
    ;lhld bitBlt_bw_3
    push b
    mov b, h
    mov c, l
    lhld bitBlt_bw_2
    xchg    
    lhld bitBlt_bw_1
bitBlt_bw_l1:
    push h
    push b
    lda  color
    mov  b, a
bitBlt_bw_l2:
    ldax d
    mov m, a

    mvi a, 1
    sta 0F900H
    mov m, b
    xra a
    sta 0F900H

    inx h
    inx d
    dcr c
    jnz bitBlt_bw_l2 - bitBlt + 0F000h

    pop b
    pop h
    inr h
    dcr b
    jnz bitBlt_bw_l1 - bitBlt + 0F000h
    pop b
  }
}

void colorRect(uchar* d, uint wh) {
  asm {
    jmp colorRect_himem - bitBlt + 0F000h
colorRect_himem:
    ; hl = colorRect_2
    xchg
    lhld colorRect_1
    lda  color
    push psw
    mvi  a, 1
    sta  0F900H
    pop  psw
colorRect_l1:
    push h
    push d
colorRect_l2:
    mov  m, a
    inx  h
    dcr  e
    jnz  colorRect_l2 - bitBlt + 0F000h    
    pop  d
    pop  h
    inr  h
    dcr  d
    jnz  colorRect_l1 - bitBlt + 0F000h
    xra  a
    sta  0F900H
  }
}