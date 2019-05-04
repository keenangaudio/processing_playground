int sum = 0;
int number = 999999;
do{
  sum+=number%10;
  number/=10;
}while (number != 0);
println(sum);
exit();