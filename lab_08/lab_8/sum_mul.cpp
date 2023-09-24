//       float - 6-7 чисел (32-разрядная)
//      double - 15 чисел  (64-разрядная)

#include <iostream>
#include <ctime>
#include <cmath>

using namespace std;
#define TIMES 1e7

void cout_time(clock_t time, const char* action)
{
    if (time >= 1000)
        cout << "   " << action << ": " << ((double)time) / CLOCKS_PER_SEC << " s.";
    else
        cout << "   " << action << ": " << ((double)time) << " ms.";
}

template <typename Type>
Type sum(Type a, Type b)
{
    Type result = 0;
    clock_t start_time, res_time = 0;

    for (int i = 0; i < TIMES; i++)
    {
        start_time = clock();
        result = a + b;
        res_time += clock() - start_time;
    }

    cout_time(res_time, "Sum");

    return result;
}

template <typename Type>
Type mul(Type a, Type b)
{
    Type result = 0;
    clock_t start_time, res_time = 0;

    for (int i = 0; i < TIMES; i++)
    {
        start_time = clock();
        result = a * b;
        res_time += clock() - start_time;
    }

    cout_time(res_time, "Mul");

    return result;
}

template <typename Type>
Type div(Type a, Type b)
{
    Type result = 0;
    clock_t start_time, res_time = 0;

    for (int i = 0; i < TIMES; i++)
    {
        start_time = clock();
        result = a / b;
        res_time += clock() - start_time;
    }

    cout_time(res_time, "Div");

    return result;
}

template <typename Type>
Type sum_asm(Type a, Type b)
{
    Type result = 0;
    clock_t start_time, res_time = 0;

    for (int i = 0; i < TIMES; i++)
    {
        start_time = clock();
        __asm__(
            "fld %1\n"                                          
            "fld %2\n"                                         
            "faddp\n"                                           
            "fstp %0\n"                                       
            : "=m"(result)                                    
            : "m"(a),                                         
              "m"(b)                                     
        );
        res_time += clock() - start_time;
    }
    
    cout_time(res_time, "Sum");
    
    return result;
}

template <typename Type>
Type mul_asm(Type a, Type b)
{
    Type result = 0;
    clock_t start_time, res_time = 0;

    for (int i = 0; i < TIMES; i++)
    {
        start_time = clock();
        __asm__
        (
            "fld %1\n"
            "fld %2\n"
            "fmulp\n"
            "fstp %0\n"
            :"=m"(result)
            : "m"(a),
            "m"(b)
        );
        res_time += clock() - start_time;
    }

    cout_time(res_time, "Mul");

    return result;
}

template <typename Type>
void time_measure(Type a, Type b)
{
    #ifdef ASM
    cout << "   ASM:";
    sum_asm(a, b);
    mul_asm(a, b);
    #else
    cout << "   CPP:";
    sum(a, b);
    mul(a, b);
    #endif
}

int main()
{
    float f1 = 1.1f;
    float f2 = 2.3f;
    cout << " FLOAT:" << endl;
    time_measure(f1, f2);

    double d1 = 2.3;
    double d2 = 5.6;
    cout << "\n DOUBLE:" << endl;
    time_measure(d1, d2);
    cout << "\n";

    return 0;
}