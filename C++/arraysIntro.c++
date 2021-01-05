#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    /* Enter your code here. Read input from STDIN. Print output to STDOUT */
    //Initialize number of integers variable
    int no_of_int;
    //Get input of number of integers
    scanf("%i", &no_of_int);
    //Initialize numbers array
    int numbers[no_of_int];
    //Get Input of numbers
    for (int i=0;i<no_of_int;i++){
        scanf("%i", &numbers[i]);
    }
    //Print in reverse order
    for (int i=no_of_int-1;i>=0;i--){
        printf("%i ",numbers[i]);
    }
    return 0;
}
