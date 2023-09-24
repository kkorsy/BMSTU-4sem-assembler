#include <stdio.h>
#include <time.h>

#define N 4

typedef struct vector
{
    float list[N];
} vector_t;

void cout_time(clock_t time, const char* action)
{
    printf("%s: %lf s.\n", action, ((double)time));
}

vector_t sum(const vector_t v1, const vector_t v2)
{
    vector_t result = { 0 };

    for (int i = 0; i < N; i++)
        result.list[i] = v1.list[i] + v2.list[i];

    return result;
}

vector_t sse_sum(const vector_t v1, const vector_t v2)
{
    vector_t result = { 0 };
    __asm__(
        "movups %%xmm0, %1\n"
        "movups %%xmm1, %2\n"

        "vaddps %%xmm2, %%xmm1, %%xmm0\n"
        
        "movups %0, %%xmm2\n"
        : "=m"(result)                                     
        : "m"(v1.list),                                     
            "m"(v2.list)
    );

    return result;
}

int main()
{
    vector_t v1 = { 1e-5, 2.32, 4.45, 1.78};
    vector_t v2 = {2.900, 3.0, 4.43, 1.2};

    printf("%f\n", sum(v1, v2).list[2]);
    printf("%f\n", sse_sum(v1, v2).list[2]);

    return 0;
}
