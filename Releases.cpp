#include <iostream>
#include <conio.h>
#include <windows.h>
using namespace std;
void clrscr() { system("cls"); }
void gotoxy(int x, int y)
{
    COORD coord;
    coord.X = x;
    coord.Y = y;
    SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), coord);
}

int main()
{
	clrscr();
	gotoxy(20,1); cout << "============================================";
	gotoxy(25,2); cout << "Pack version releases and support";
	gotoxy(20,3); cout << "============================================";
	
	gotoxy(10, 5); cout << "Editions";
	gotoxy(40, 5); cout << "Supported Versions";
	
	gotoxy(10,9); cout << "Java Edition pack";
	
	gotoxy(45, 8); cout << "1.20";
	gotoxy(45, 9); cout << "1.20.1";
	gotoxy(45, 10); cout << "1.20.2";
	gotoxy(45, 11); cout << "1.20.3";
	gotoxy(45, 12); cout << "1.20.4";
	gotoxy(42, 13); cout << "1.21-Snapshots";
	
	gotoxy(10,17); cout << "Bedrock Edition pack";
	
	gotoxy(45,16); cout << "1.20.0";
	gotoxy(45,17); cout << "1.20.10";
	gotoxy(45,18); cout << "1.20.30";
	gotoxy(45,19); cout << "1.20.40-50";
	gotoxy(40,20); cout << "1.21-Preview / Beta";
	
	gotoxy(8,22); cout << "Note: Vulkan mod for Java Edition makes text dark in inventory!";
	gotoxy(8,23); cout << "Check 'Credits.txt' to view used textures and their respective authors.";
	
	gotoxy(40,25); cout << "Press any key to continue";
	getch();
	
	return 0;
}
