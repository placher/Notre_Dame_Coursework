//main.cpp for puzzle
//J. Patrick Lacher

#include "puzzle.h"

int main(){
	//get the name of the puzzle from the user
	string target;
	cout << "\nEnter the name of the puzzle.txt file: ";
	cin >> target;
	cout << "\n";
	
	//initialize puzzle and movement variables
	puzzle<int> game(target);
	vector < vector < vector <int> > > possible;
	vector < vector <int> > buffer1;
	vector <int> buffer2;
	
	//populate the initial values of the possible moves vector
	int i,j,k,l,m,n,moves,rsingleton,csingleton,bsingleton;
	
	for (i=0;i<9;i++){
		for (j=0;j<9;j++){
			if (game.getSpace(i,j) == '0'){
				for (k=1;k<10;k++){
						if (game.canPlaceNumber(i,j,k)) buffer2.push_back(k);
				}
			}
			else buffer2.push_back(0);
			buffer1.push_back(buffer2);
			buffer2.erase(buffer2.begin(),buffer2.end());
		}
		possible.push_back(buffer1);
		buffer1.erase(buffer1.begin(),buffer1.end());
	}
	
	while (game.isVictory() == 0){
		
		//resets number of moves made this round
		moves = 0;
		
		//places any single possible values indicated in the possible vector
		for (i=0;i<9;i++){
			for (j=0;j<9;j++){
				if (possible[i][j].size() == 1 && possible[i][j][0] != 0){
					game.placeNumber(i,j,possible[i][j][0]);
					possible[i][j][0] = 0;
					moves = 1;
				}
			}
		}
		
		//searches for and places singletons
		if (moves == 0){
			for (i=0;i<9;i++){
				for (j=0;j<9;j++){
					for (k=0;k<possible[i][j].size();k++){
						//check value in possible array against all other values in row, column, and cell
						rsingleton = 1;
						csingleton = 1;
						bsingleton = 1;
						
						//check column row
						for (l=0;l<9;l++){
							//check column
							if (l != i){
								for (m=0;m<possible[l][j].size();m++){
									if (possible[i][j][k] == possible[l][j][m]) csingleton = 0;
								}
							}
							
							//check row
							if (l != j){
								for (m=0;m<possible[i][l].size();m++){
									if (possible[i][j][k] == possible[i][l][m]) rsingleton = 0;
								}
							}
						}
						
						//check cell
						if (i < 3){
							if (j < 3){
								for (int l=0; l<3; l++){
									for (int m=0; m<3; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 2 && j < 6){
								for (int l=0; l<3; l++){
									for (int m=3; m<6; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 5){
								for (int l=0; l<3; l++){
									for (int m=6; m<9; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
						}
						if (i > 2 && i < 6){
							if (j < 3){
								for (int l=3; l<6; l++){
									for (int m=0; m<3; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 2 && j < 6){
								for (int l=3; l<6; l++){
									for (int m=3; m<6; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 5){
								for (int l=3; l<6; l++){
									for (int m=6; m<9; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
						}
						if (i > 5){
							if (j < 3){
								for (int l=6; l<9; l++){
									for (int m=0; m<3; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 2 && j < 6){
								for (int l=6; l<9; l++){
									for (int m=3; m<6; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
							if (j > 5){
								for (int l=6; l<9; l++){
									for (int m=6; m<9; m++){
										for (n=0;n<possible[l][m].size();n++){
											if (possible[i][j][k] == possible[l][m][n]) bsingleton = 0;
										}
									}
								}
							}
						}
						
						//places singleton if one exists
						if (rsingleton || csingleton || bsingleton){
							if (possible[i][j][k] != 0){
								game.placeNumber(i,j,possible[i][j][k]);
								moves = 1;
								break;
							}
						}
					}
				}
			}
		}

		//quits if no moves can be made
		if (moves == 0){
			cout << "No further moves can be made by the algorithm\n";
			break;
		}
		
		//remove old possible values
		possible.erase(possible.begin(),possible.end());
		
		//recompute the vector of possible moves in the board
		for (i=0;i<9;i++){
			for (j=0;j<9;j++){
				if (game.getSpace(i,j) == '0'){
					for (k=1;k<10;k++){
							if (game.canPlaceNumber(i,j,k)) buffer2.push_back(k);
					}
				}
				else buffer2.push_back(0);
				buffer1.push_back(buffer2);
				buffer2.erase(buffer2.begin(),buffer2.end());
			}
			possible.push_back(buffer1);
			buffer1.erase(buffer1.begin(),buffer1.end());
		}
		
	}
	
	cout << "The current solution to the passed sudoku puzzle is:\n\n";
	game.print();
	
	return 0;
}