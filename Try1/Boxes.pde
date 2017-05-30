public class Boxes{
  Box [] cajas;
  int size;
  public Boxes(int t){
    cajas = new Box[t];
    size = 0;
  }
  
  public void add(Box b){
    cajas[size] = b;
    size++;
  }
  
  public boolean contains(int x, int y, int z){
    if(size == 0)
      return false;
    for(int i = 0; i < size; i++){
      if(cajas[i].boxOn(x,y,z))
        return true;
    }
    return false;
  }
  
  public Box get(int index){
    return cajas[index];
  }
  
  public int size(){
    return size;
  }
}