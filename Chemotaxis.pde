 /*Rosa Martinez
 02/26/25
 Learning Goal: Students will apply object-oriented programming concepts, 
 including arrays of objects, constructors, and methods, to create a simulation
 of organisms performing a biased random walk in response to a stimulus using 
 Math.random().
 */

Walker [] aliens; // array of walker class

int bigBallX = 300;
int bigBallY = 300;
int bigBallSize = 100;

void setup() {
  size(600, 600);
  aliens = new Walker[10]; // number of small balls
  for (int i = 0; i < aliens.length; i++) {
    aliens[i] = new Walker();
  }
}

void draw() {
  background(0);
  
  // Move and show the bacteria
  boolean allGathered = true;
  for (int i = 0; i < aliens.length; i++) {
    aliens[i].walk();
    aliens[i].show();
    
    // Check if the alien ball is far from the center
    double distance = dist(aliens[i].myX, aliens[i].myY, bigBallX, bigBallY);
    if (distance > bigBallSize / 2) {
      allGathered = false; // At least one ball is not gathered yet
    }
  }

  // Draw the big ball (black hole)
  fill(255, 0, 0); // Red color for the big ball
  ellipse(bigBallX, bigBallY, bigBallSize, bigBallSize);

  // End the program if all balls are gathered at the center
  if (allGathered) {
    endSimulation();
  }
}

void endSimulation() {
  // Stops the draw loop and ends the program
  noLoop();
  println("All aliens have been sucked into the void");
}

class Walker {
  int myX, myY;

  Walker() {
    // Start at random positions across the screen
    myX = (int)(Math.random() * width);
    myY = (int)(Math.random() * height);
  }

  void walk() {
    // Move towards the big ball (focal point) with a slower speed
    int speed = 1; // Lower the speed to make the balls move slower

    // Calculate direction from the ball to the center of the big ball
    if (myX < bigBallX) {
      myX += speed;
    } else if (myX > bigBallX) {
      myX -= speed;
    }

    if (myY < bigBallY) {
      myY += speed;
    } else if (myY > bigBallY) {
      myY -= speed;
    }
  }

  void show() {
    fill(255); // small balls (aliens)
    noStroke();
    ellipse(myX, myY, 50, 50); // Draw the small balls
  }
}
