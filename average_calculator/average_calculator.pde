import javax.swing.JOptionPane;
FloatList numbers = new FloatList();
float answer = 0;
String x = (JOptionPane.showInputDialog("Input ten numbers separated by a comma"));
numbers.append(parseFloat(x.split(",")));
for (int i = 0; i<numbers.size();i++)
  answer += numbers.get(i);
answer /= numbers.size();
println(answer);