#include <iostream>
#include <cstdio>
using namespace std;

int main() {
    // Complete the code.
    //Initialize variables
    int a;
    int b;
    //Get Input
    scanf("%i %i", &a, &b);
    //Do for loop in range of
    for (int i=a; i<=b;i++){
        switch(i){
            case 1:
                printf("one");
                break;
            case 2:
                printf("two");
                break;
            case 3:
                printf("three");
                break;
            case 4:
                printf("four");
                break;
            case 5:
                printf("five");
                break;
            case 6:
                printf("six");
                break;
            case 7:
                printf("seven");
                break;
            case 8:
                printf("eight");
                break;
            case 9:
                printf("nine");
                break;
            default:
                //For any number outside of range
                if (i%2==0) printf("even");
                else printf("odd");
                
        }
        //Print New line
        printf("\n");
    }
    return 0;
}