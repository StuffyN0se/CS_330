#ifndef __asgn2__
#define __asgn2__
#include <stdio.h>
#include <math.h>

/* the two lines above check to ensure
we haven't already included this header*/

/* your functions go here */
void cubeOfOdd(int n) {
    int cubed = 0;
        for (int i = n - 1; i > 0; i--){
            if ( i % 2 != 0) {      // if not divisble by 2 the its odd so cube
                cubed = i * i * i;
                printf("%d ", cubed);
        }
        
    }
    
}
// helper function to determine if a number if prime
int isPrime(int n ){
    if (n%2 == 0){
        return 0;
    }
    else if (n <= 1){
        return 0;
    }
    else if (n == 2 && n ==3){
        return 1;
    }
    else if (n% 3 ==0 && n!=3 ){
        return 0;
    }
    else 
    return 1;
}

void introToCS330(int n) {
    int cubed = n*n*n;
    if (n% 3 == 0 && n% 7 == 0){  // first if it statisfies all three print uab and stop
        printf("UAB CS330");
    }
    else if (n% 7 == 0){         // if it doesnt satisfy the first condition continue and see if it's a divisble by 7
        printf("UAB");
    }
    else if (n% 3 == 0){        // if its divible by 3
        printf("CS");
    }
    else if (isPrime(n) == 1) { // if its prime using helper function
        printf("GO BLAZERS");
    }
    else
    printf("%d", cubed);        // and lastly if its non of the above cube it
}
// a helper function to help with print HELLO
int powerOfTwo(double n){
// 1 is a power of 2
    if (n == 1){
// 1 = true
        return 1;
    }
    else {
        while (n > 2){
// while n > 2 divided n by two over and over
            n = n /2;
            
        }
        if (n == 2){
            return 1;
        } 
        else {
            return 0;
        }  
    } 
}

void printHello (int n){
// starting from 0 until n
    for (int i = 0; i < n + 1; i++){
// checks to see if number is a power of 2
// if so print HELLO
        if (powerOfTwo(i) == 1){
            printf("HELLO");
        }
// if not then print number
        else if (powerOfTwo(i) == 0) {
            printf("%d", i);
        }
    }
}

void paintGallons(float length, float width, float height) {
    // calulates the SA of the room - the floor
    float surface_area = (2*(length * height)) + (2*(width * height)) +(width * length);
    // divides it by the amount one gallon of paint can cover
    double paint = (surface_area / 400) ;
    //prints the value but uses the ceiling function so it rounds up
    printf("%f" , ceilf(paint));

}

void grader(float avg_exam, float avg_hw, int attendance) {
    if (attendance < 20){                    // if attendance is under 20 fail and won't continue
        printf("FAIL");

    }
    else if (avg_exam < 70 || avg_hw < 70){ // if attendance is over 20 but either exam or hw grade is below 70 fail and won't continue
        printf("FAIL");
    }
    else if (avg_exam > 85 || avg_hw > 85){ // if it satisfies both conditions 1 and 2 but none of the grades are over 85 then fail, else pass.
        printf("PASS");
    }
    else{
        printf("FAIL");
    }
    
}

#endif
