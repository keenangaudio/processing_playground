class Node {
  float val = 20, 
    base = 20, 
    damping = 1;
  Node() {
  }
  float setH(float newVal) {
    return val = (newVal <= val)? val : newVal;
  }
  float setH() {
    return val;
  }
  void update() {
    if (val >= base)
      val -= damping;
  }
}
