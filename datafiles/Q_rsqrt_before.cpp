#include <stdio.h>
#include <stdint.h>

float quake_rsqrt(float n)
{
	int32_t i;
	float x2, y;
	const float threehalfs = 1.5f;

	x2 = n * 0.5f;
	i  = *(int32_t*)&n;
	i  = 0x5f3759df - (i >> 1);
	y  = *(float*)&i;

	y  *= threehalfs - (x2*y*y);
	return y;
}

int main()
{
	printf("Example result: %f", quake_rsqrt(3.14159f));
	return 0;
}