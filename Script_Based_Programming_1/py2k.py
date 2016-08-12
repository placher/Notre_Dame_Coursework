"""
Manage the state of a 2048 game.
2015-02-01 PJF
"""

import random
import time

class Py2k:
    """manage the state of a 2048 game."""
    def __init__(self,nr=4,nc=4):
        """set up an nr by nc (nrxnc) board. nr and nc default to 4."""
        # this will not work because of shallow copying.
        #self.board = [[0]*nc]*nr    # [[0,0,0,0], ..., [0,0,0,0]] 
        self.board = [[0]*nc for x in range(nr)]
        self.score = 0
        self.rowcoords = range(nc)
        self.colcoords = range(nc)
        self.stash = []
	return

    def getscore(self):
        """get the current score."""
        return self.score

    def setscore(self,n):
        """Set the score to n."""
        self.score=n
	return

    def randpos(self):
        """return a random position on the board."""
        return [random.choice(self.rowcoords),random.choice(self.colcoords)]

    def clearboard(self):
        """Clear the board and reset the score to 0."""
        self.board = [[0]*len(self.colcoords) for x in range(len(self.rowcoords))]
	return

    def clearscore(self):
	"""Set the score to 0."""
        self.score = 0
	return
 
    def clearboardandscore(self):
        """Set board and score to zero."""
	self.clearboard()
	self.clearscore()
	return

    def setboard(self,row,col,val):
        """Set a cell in the board to a supplied value."""
        self.board[row][col] = val
	return

    def getboard(self,r,c):
        """Get the value stored at a cell."""
        return self.board[r][c]

    def interestingboard(self,val=1024):
        """returns True if board has a cell with value greater than val (default 1024)"""
        for r in self.rowcoords:
            for c in self.colcoords:
                if self.getboard(r,c) >= val:
                    return True
        return False
 
    def boardfull(self):
        """Returns True if every cell in the board has a nonzero value."""
        for r in self.rowcoords:
            for c in self.colcoords:
                if self.getboard(r,c) == 0:
                    return False
        return True 

    def offsetcoord(self,r,c,dr,dc):
        """Helper function: return cell coordinates offet by a supplied vector. Coords may be illegal."""
	return [r+dr,c+dc]

    def validcoords(self,r,c):
        """Returns True if the coordinates of the supplied location are valid."""
        return (r in self.rowcoords) and (c in self.colcoords)

    def validmove(self,dir):
        """ returns True if any move in the specified direction is possible."""
        # A move is possible if there are two cells with the same value adjacent in the 
        # move's direction, or if there's a zero that a cell can slide into.
	if type(dir) is str:
            dir = self.mp(dir)
        for r in self.rowcoords:
            for c in self.colcoords:
                rco = self.offsetcoord(r,c,dir[0],dir[1])
                if self.validcoords(rco[0],rco[1]):
                    if self.getboard(r,c) == self.getboard(rco[0],rco[1]):
                        return True
                    if self.getboard(rco[0],rco[1]) == 0:
                        return True
        return False

    def printrowsep(self):
        """Helper function: pretty-print row separator."""
        s = ""
        for c in self.colcoords:
            s = s + '+' + '-'*6
        s = s + '+'
        print s

    def printrowspace(self):
        """Helper function: pretty-print row space."""
        s = ""
        for c in self.colcoords:
            s = s + '|' + ' '*6
        s = s + '|'
        print s

    def printboard(self):
        """Pretty-print the board."""
        for r in self.rowcoords:
            self.printrowsep()
            self.printrowspace()
            s = ""
            for c in self.colcoords:
		x = self.getboard(r,c)
		if x > 0:
                    s = s + '| %4d ' % self.getboard(r,c)
                else:
                    s = s + '|      '
            s = s + '|'
            print s
            self.printrowspace()
        self.printrowsep()
 
    def lose(self):
        """returns TRUE if there are no cells with a zero and no available moves."""
        if not self.boardfull():
            return False
        if self.validmove(self.LEFT):
            #print 'left valid'
            return False
        if self.validmove(self.RIGHT):
            #print 'right valid'
            return False
        if self.validmove(self.UP):
            #print 'up valid'
            return False
        if self.validmove(self.DOWN):
            #print 'down valid'
            return False
        return True

    def addnumber(self):
        """find an empty place and place a 2 randomly"""
        [r,c] = self.randpos()
        while self.getboard(r,c) > 0:
            [r,c] = self.randpos()
        self.setboard(r,c,2)
	return

    def movecore(self):
        """Move logic for a leftward move. Gobble up zeros, then merge from left to right, but no merges can involve a cell that was the result of another merge."""
        score = 0 # local
        for row in self.rowcoords:
            #print 'row',row
            x = [y for y in self.board[row] if y != 0]    #get rid of 0s
            #print 'collapse to ',x
            if len(x) < 2: # short circuit; we can't do any adding.
                self.board[row] = x + [0] * (len(self.colcoords)-len(x)) # pad
                #print 'too short: new row ',self.board[row]
                continue
            else:
                result = []
                while x:    #while there are any elements left in x
                    result.append(x.pop(0))
                    if not x: break     #ran out of elements
                    #print 'while loop, currently result :',result,' x:',x
                    if result[-1] == x[0]:    #merge
                        result[-1] = result[-1] + x[0]
                        score = score + result[-1]
                        x.pop(0) # get rid of number on right since we merged it
                #print 'after any adding: new row ',result 
                self.board[row] = result + [0] * (len(self.colcoords)-len(result)) # pad
                #print 'and board row: ',self.board[row]
        return score # local
 
    def mp(self,movechar):
        """return the movement vector associated with a character (LlRrUuDd) denoting a move."""
        m = {'u':self.UP, 'l':self.LEFT, 'r':self.RIGHT, 'd':self.DOWN}
        movechar = movechar.lower()
        if movechar not in m:
            print 'invalid move character %c. no move made' % movechar
            sys.exit(-1)
        return m[movechar]
 

    def move(self,c):
        """perform a move in any direction."""
        c = c.lower()
        v = self.mp(c)
        if v == self.LEFT:
            #print 'left'
            self.score = self.score + self.movecore()
        elif v == self.RIGHT: # vertical flip, move, vertical flip
            #print 'right'
            junk = [x.reverse() for x in self.board]
            self.score = self.score + self.movecore()
            junk = [x.reverse() for x in self.board]
        elif v == self.UP: # transpose, move, transpose
            #print 'up'
            self.board = map(list,zip(*self.board))
            self.score = self.score + self.movecore()
            self.board = map(list,zip(*self.board)) 
        elif (v == self.DOWN): # flip, transpose, move, transpose, flip
            #print 'down'
            self.board = self.board[::-1]
            self.board = map(list,zip(*self.board)) 
            self.score = self.score + self.movecore()
            self.board = map(list,zip(*self.board))
            self.board = self.board[::-1]
        else:
            print 'Impossible thing happened.  Move vector is :',move
            sys.exit(-1)
	return
 
    def push(self):
        """Save the game state in a stack."""
        self.stash.append([self.board,self.score,random.getstate()])
	return

    def pop(self):
        """Retrieve saved board state from stack. Will croak if stack is empty."""
        [self.board,self.score,state] = self.stash.pop()
	random.setstate(state)
	return

    def deltascore(self,dir):
        """Return increase in score for a given move direction, without changing state."""
	#if type(dir) is str:
            #dir = self.mp(dir)
        s = self.getscore()
        self.push()
        self.move(dir)
        s = self.getscore() - s
        self.pop()
        return s 
 
    # handy constants
    LEFT = [0,-1]
    RIGHT = [0,1]
    UP = [-1,0]
    DOWN = [1,0]

    # the saved-game stash
    stash = []
