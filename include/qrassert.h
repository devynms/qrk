#ifndef QASSERT_H
#define QASSERT_H

#include "gpio.h"

#define assert(test) do { \
	if (test) { DoTheThings(); } \
} while (0)

#endif
