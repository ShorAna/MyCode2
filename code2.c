#include <stdio.h> //Standartowe biblioteki
#include <stdlib.h>
#include "cube.h"
#include "square.h"

int main(void){
	double a;
	printf("Podaj argument: ");
	scanf("%le", &a);
	printf("\n\n");
	printf("Pole kwadratu: %f\n", get_square_area(a));
	printf("Objetosc szescianu: %f\n", get_cube_volume(a));
	return 0; //OK
}
