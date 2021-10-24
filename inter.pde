float rc=0, gc=0, bc=0;
float speed, dd;
float px=0, py=0, pdd=1;
boolean bool = false;

void setup(){
  size(1000,600);
  background(255);
  fill(233);
  noStroke();
  rect(230,-30,720,516);
  
  fill(180);
  noStroke();
  rect(230,504,720,100);
  
  fill(210,0,0);
  rect(40,296,150,40);
  fill(0,210,0);
  rect(40,371,150,40);
  fill(0,0,210);
  rect(40,446,150,40);
  
  textSize(20.5);
  fill(100);
  text("0-----------------255",40,290);
  text("0-----------------255",40,365);
  text("0-----------------255",40,440);
  
  stroke(0);
  strokeWeight(0.5);
  line(0,50,1000,50);
  
  textSize(30);
  fill(80);
  text("R:",3,325);
  text("G:",3,400);
  text("B:",3,475);
  
}

void draw(){
  frameRate(2000);
  if(mousePressed){
    if(mouseX>=40 & mouseX<=190){
      if(mouseY>=296 & mouseY<=336){
        rc = map(mouseX, 40, 190, 0, 255);
        fill(rc,0,0,10);
        strokeWeight(1);
        stroke(255,100);
        ellipse(mouseX,316,45,45);
      }else if(mouseY>=371 & mouseY<=411){
        gc = map(mouseX, 40, 190, 0, 255);
        fill(0,gc,0,10);
        strokeWeight(1);
        stroke(255,100);
        ellipse(mouseX,391,45,45);
      }else if(mouseY>=446 & mouseY<=486){
        bc = map(mouseX, 40, 190, 0, 255);
        fill(0,0,bc,10);
        strokeWeight(1);
        stroke(255,100);
        ellipse(mouseX,466,45,45);
      }
    }
    if(mouseX>=230 & mouseX<=950 & mouseY>=0 & mouseY<=486){
      if(bool){
        speed = dist(px, py, mouseX, mouseY);
        dd = map(speed, 0, 1000, 1, 3000)*0.1 + pdd*0.9;
        pdd = dd;
        strokeWeight(dd);
        fill(rc,gc,bc);
        stroke(rc,gc,bc);
        smooth();
        line(px,py,mouseX,mouseY);
      }
      bool = true;
    }else{ bool = false; pdd = 0; }
  }else{ bool = false; pdd = 0; } 
  px = mouseX;
  py = mouseY;
  
  fill(255);
  noStroke();
  rect(0,499,1000,110);
  fill(180);
  noStroke();
  rect(230,514,720,100);
  
  textSize(150);
  fill(0);
  text("R" + str(int(rc)) + " G" + str(int(gc)) + " B" + str(int(bc)),-6,600);
  
  fill(rc, gc, bc);
  noStroke();
  ellipse(108,130,175,175);
}

void keyReleased() {
  if (keyCode == DELETE || keyCode == BACKSPACE) {
    fill(233);
    noStroke();
    rect(230,-30,720,530);
    
    stroke(0);
    strokeWeight(0.5);
    line(0,50,1000,50);
    rc = 0; gc = 0; bc = 0;
    px = 0; py = 0;
    bool = false;
  }
  if (keyCode == SHIFT) {
    rc = 0; gc = 0; bc = 0;
  }
}
