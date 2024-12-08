class Tile {

    int tx,ty,tsize,_colr;

    boolean selected;
    int difx,dify;

  Tile(int x, int y, int s) {
  tsize=max(s,10);
  tx=x;
  ty=y;
  _colr=int(random(3));
  }//constructor


  void display() {
    if (_colr==0) {
      fill(255,0,0);
    }
    else if (_colr==1) {
      fill(0,255,0);
    }
    else {
      fill(0,0,255);
    }
    square(tx,ty,tsize);
  }//display



  void select(int x, int y) {
    difx=x-tx;
    dify=y-ty;
    if (difx>0 && difx<tsize && dify>0 && dify<tsize) {
      selected=true;
    }
    else {
      selected=false;
    }
  }//select

  void setXY(int x, int y) {
    if (selected) {
      tx=x-difx;
      ty=y-dify;
    }
  }//setXY

}//Tile
