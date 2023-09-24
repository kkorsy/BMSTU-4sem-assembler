#include <stdio.h>
#include <stdlib.h>

#include <time.h>
#include <math.h>

// fld загружает на вершину стека
// faddp складывает ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
// fstp извлекаем число из FPU в память, в данном случае из ST(0) в result

#define REPEATS 10000

double sum_float(float x, float y)
{
    float res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
        res = x + y;
    time_t t2 = clock();

    (void) res;

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double sum_float_asm(float x, float y)
{
    float res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
    {
        __asm__(
            "fld %1\n"                                          // загружаем a на вершину стека
            "fld %2\n"                                          // загружаем b на вершину стека
            "faddp %%ST(1), %%ST(0)\n"                          // складываем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
            "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m"(res)                                      // res - выходной параметр
            : "m"(x),                                           // a - входной параметр
              "m"(y)                                            // b - входной параметр
        );
    }
    time_t t2 = clock();

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double mul_float(float x, float y)
{
    float res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
        res = x * y;
    time_t t2 = clock();

    (void) res;

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double mul_float_asm(float x, float y)
{
    float res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
    {
        __asm__(
            "fld %1\n"                                          // загружаем a на вершину стека
            "fld %2\n"                                          // загружаем b на вершину стека
            "fmulp %%ST(1), %%ST(0)\n"                          // складываем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
            "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m"(res)                                      // res - выходной параметр
            : "m"(x),                                           // a - входной параметр
              "m"(y)                                            // b - входной параметр
        );
    }
    time_t t2 = clock();

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}


double sum_double(double x, double y)
{
    double res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
        res = x + y;
    time_t t2 = clock();

    (void) res;

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double sum_double_asm(double x, double y)
{
    double res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
    {
        __asm__(
            "fld %1\n"                                          // загружаем a на вершину стека
            "fld %2\n"                                          // загружаем b на вершину стека
            "faddp %%ST(1), %%ST(0)\n"                          // складываем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
            "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m"(res)                                      // res - выходной параметр
            : "m"(x),                                           // a - входной параметр
              "m"(y)                                            // b - входной параметр
        );
    }
    time_t t2 = clock();

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double mul_double(double x, double y)
{
    double res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
        res = x * y;
    time_t t2 = clock();

    (void) res;

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}

double mul_double_asm(double x, double y)
{
    double res;

    time_t t1 = clock();
    for (int i = 0; i < REPEATS; i++)
    {
        __asm__(
            "fld %1\n"                                          // загружаем a на вершину стека
            "fld %2\n"                                          // загружаем b на вершину стека
            "fmulp %%ST(1), %%ST(0)\n"                          // складываем ST(1) и ST(0), сохраняем результат в ST(1) и извлекаем из стека сопроцессора (поэтому 'p' в названии команды)
            "fstp %0\n"                                         // извлекаем число из FPU в память, в данном случае из ST(0) в res
            : "=m"(res)                                         // res - выходной параметр
            : "m"(x),                                           // a - входной параметр
              "m"(y)                                            // b - входной параметр
        );
    }
    time_t t2 = clock();

    return (double)(t2 - t1) / CLOCKS_PER_SEC;
}


double loaded_pi()
{
    double pi, res;
    __asm__(
        "fldpi\n"
        "fsin\n"
        "fstp %0\n"
        :"=m"(res)
    );
    return res;
}

int main(void)
{
    float x, y;
    double xd, yd;
    xd = x = (double)rand() / RAND_MAX + 1;
    yd = y = (double)rand() / RAND_MAX + 1;

    printf("x---------------x--------------- x----------------x\n");
    printf("|     SUM       |     float      |     double     |\n");
    printf("x---------------x----------------x----------------x\n");
    printf("|      C        |");
    printf("%16lf|%16lf|\n", sum_float(x, y), sum_double(xd, yd));
    printf("x----------------x---------------x----------------x\n");
    printf("|     asm       |");
    printf("%16lf|%16lf|\n", sum_float_asm(x, y), sum_double_asm(xd, yd));
    printf("x----------------x---------------x----------------x\n\n");

    printf("x---------------x--------------- x----------------x\n");
    printf("|      MUL      |     float      |     double     |\n");
    printf("x---------------x----------------x----------------x\n");
    printf("|      C        |");
    printf("%16lf|%16lf|\n", mul_float(x, y), mul_double(xd, yd));
    printf("x----------------x---------------x----------------x\n");
    printf("|     asm       |");
    printf("%16lf|%16lf|\n", mul_float_asm(x, y), mul_double_asm(xd, yd));
    printf("x----------------x---------------x----------------x\n\n");

    printf("\n3.14: sin(pi) = %lf\n3.141596: sin(pi) = %lf\nloaded: sin(pi) = %lf\n", sin(3.14), sin(3.141596), sin(loaded_pi()));

    return 0;
}