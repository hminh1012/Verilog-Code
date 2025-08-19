#ifndef _ARRAY_FIFO_H_
#define _ARRAY_FIFO_H_

#include <stdio.h>

typedef int din_t;
typedef int dout_t;
typedef int didx_t;

void array_FIFO(dout_t d_o[4], din_t d_i[4], didx_t idx[4]);

#endif
