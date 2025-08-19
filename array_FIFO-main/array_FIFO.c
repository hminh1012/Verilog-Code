#include "array_FIFO.h"

void array_FIFO (dout_t d_o[4], din_t d_i[4], didx_t idx[4])
{
	int i;
	For_Loop: for (i=0;i<4;i++)
	{
		d_o[i] = d_i[idx[i]];
	}
}