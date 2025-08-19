#include "cpp.FIR.h"

cpp_FIR(data_t x)
{
    static CFir<coef_t, data_t, acc_t> fir1;

    return fir1(x);

}