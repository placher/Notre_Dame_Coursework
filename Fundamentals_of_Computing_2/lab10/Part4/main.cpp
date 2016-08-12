//main.cpp for sudoku solver
//J. Patrick Lacher

/* Uses sets to solve easy sudoku puzzles*/

#include "puzzle.h"
#include <set>

using namespace std;

int main(){
	//get the name of the puzzle from the user
	string target;
	cout << "\nEnter the name of the puzzle.txt file: ";
	cin >> target;
	cout << "\n";
	
	//initialize puzzle and movement variables
	puzzle<int> game(target);
	vector < vector < set <int> > > possible;
	vector < set <int> > buffer1;
	set <int> buffer2;
	
	//populate the initial values of the possible moves vector
	int i,j,l,m,moves,rsingleton,csingleton,bsingleton;
	
	for (i=0;i<9;i++){
		for (j=0;j<9;j++){
			if (game.getSpace(i,j) == '0'){
				for (l=1;l<10;l++){
						if (game.canPlaceNumber(i,j,l)) buffer2.insert(l);
				}
			}
			else buffer2.insert(0);
			buffer1.push_back(buffer2);
			buffer2.clear();
		}
		possible.push_back(buffer1);
		buffer1.clear();
	}
	
	while (game.isVictory() == 0){
		
		//resets number of moves made this round
		moves = 0;
		
		//places any single possible values indicated in the possible vector
		for (i=0;i<9;i++){
			for (j=0;j<9;j++){
				auto it = possible[i][j].begin();
				if (possible[i][j].size() == 1 && *it != 0){
					game.placeNumber(i,j,*it);
					possible[i][j].clear();
					possible[i][j].insert(0);
					moves = 1;
				}
			}
		}
		
		//searches for and places singletons
		if (moves == 0){
			for (i=0;i<9;i++){
				for (j=0;j<9;j++){
					for (auto k=possible[i][j].begin(); k!=possible[i][j].end(); ++k){
						//check value in possible array against all other values in row, column, and cell
						rsingleton = 1;
						csingleton = 1;
						bsingleton = 1;
						
						//check column and row
						for (l=0;l<9;l++){
							//check column
							if (l != i){
								for (auto n=possible[l][j].begin();n!=possible[l][j].end();++n){
									if (*k == *n){
										csingleton = 0;
										break;
									}
								}
							}
							
							//check row
							if (l != j){
								for (auto n=possible[i][l].begin();n!=possible[i][l].end();++n){
									if (*k == *n){
										rsingleton = 0;
										break;
									}
								}
							}
							
							//break if neither singletion is possible
							if (!csingleton && !rsingleton) break;
						}
						
						//check cell
						if (i < 3){
							if (j < 3){
								for (int l=0; l<3; l++){
									for (int m=0; m<3; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 2 && j < 6){
								for (int l=0; l<3; l++){
									for (int m=3; m<6; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 5){
								for (int l=0; l<3; l++){
									for (int m=6; m<9; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
						}
						if (i > 2 && i < 6){
							if (j < 3){
								for (int l=3; l<6; l++){
									for (int m=0; m<3; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 2 && j < 6){
								for (int l=3; l<6; l++){
									for (int m=3; m<6; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 5){
								for (int l=3; l<6; l++){
									for (int m=6; m<9; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
						}
						if (i > 5){
							if (j < 3){
								for (int l=6; l<9; l++){
									for (int m=0; m<3; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 2 && j < 6){
								for (int l=6; l<9; l++){
									for (int m=3; m<6; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
							if (j > 5){
								for (int l=6; l<9; l++){
									for (int m=6; m<9; m++){
										for (auto n=possible[l][m].begin();n!=possible[l][m].end();++n){
											if (*k == *n){
												bsingleton = 0;
												break;
											}
										}
										if (!bsingleton) break;
									}
									if (!bsingleton) break;
								}
							}
						}
						
						//places singleton if one exists
						if (rsingleton || csingleton || bsingleton){
							if (*k != 0){
								game.placeNumber(i,j,*k);
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
		possible.clear();
		
		//recompute the vector of possible moves in the board
		for (i=0;i<9;i++){
			for (j=0;j<9;j++){
				if (game.getSpace(i,j) == '0'){
					for (l=1;l<10;l++){
							if (game.canPlaceNumber(i,j,l)) buffer2.insert(l);
					}
				}
				else buffer2.insert(0);
				buffer1.push_back(buffer2);
				buffer2.clear();
			}
			possible.push_back(buffer1);
			buffer1.clear();
		}
		
	}
	
	cout << "The current solution to the passed sudoku puzzle is:\n\n";
	game.print();
	
	return 0;
}