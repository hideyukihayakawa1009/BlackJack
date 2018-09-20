

array=();
for((i=0; i < 12; i++));
do
array[$i]=$(( $i + 1));
done

# シャッフル関数
shuffle() {
local i tmp size max rand

size=${#array[*]}
max=$(( 32768 / size * size ))

for ((i=size-1; i>0; i--)); do
while (( (rand=$RANDOM) >= max )); do :; done
rand=$(( rand % (i+1) ))
tmp=${array[i]} array[i]=${array[rand]} array[rand]=$tmp
done
}
###########################
# カードのシャッフル
shuffle
# 1枚目のカード
card1=${array[0]};
# 2枚目のカード
card2=${array[1]};

sum1=$((card1));
sum2=$((card2));
###########################
ww=$((RANDOM % 2));
if [ ww == 0 ] ; then
echo 'プレイヤーは先攻';
else
echo 'プレイヤーは後攻';
fi
############先攻#############
echo 'Player : '$sum1
echo 'CPU : ?'
#終わる条件
j=0;

flag0=0
flagg=0
flaggg=0

###互いパス###
flag1=0;
flag2=1;
###21を超えた###
flag3=0;
flag4=1;
##############

while true
do

j=$((++j));

card1=${array[$((j * 2))]};
card2=${array[$((j*2+1))]};
if [ $j = 13 ]; then
break;
fi
read -p $j'枚目をひきますか？(y/n) : ' n
if [ $n = 'y' ] ; then
sum1=$((sum1 + card1));
echo 'Player : '$card1' 合計 : '$sum1
if [ 21 -lt $sum1 ] ; then
echo 'プレイヤー OVER'
flag3=2;
break;
fi
else
echo 'Player : '$card1'合計 :' $sum1
flag1=2;
fi
if [ $n = n ]; then
flaggg=1
fi

if [ $sum2 -lt 15 ] ; then
sum2=$((sum2 + card2));
flag0=1
echo 'CPU : '$card2' 合計 : '$sum2
if [ 21 -lt $sum2 ] ; then
echo 'CPU OVER'
flag4=2;
break;
fi
else
if [ $flag0 = 0 ]; then
echo 'CPUは引きませんでした。'
else
flagg=1
fi
echo 'CPU : '$card2'合計 : '$sum2 
flag2=2;
fi
if [ $flagg = 1 ] && [ $flaggg = 1 ]; then
break;
fi
done

if [ $j = 13 ] || [ $flagg = 1 ] && [ $flaggg = 1 ]; then 
################お互いパス#############
if [ $flag1 == $flag2 ] ; then
echo '結果'
echo 'プレイヤー : '$sum1
echo 'CPU : '$sum2
if [ $sum1 -lt $sum2 ] ; then
echo 'CPU WIN'
else
echo 'プレイヤー WIN'
fi
fi
exit
fi
##############21超えた##############
if [ $flag3 == $flag4 ] ; then
echo '結果'
echo '引き分け'
elif [ $flag3 == 2 ] ; then
echo '結果'
echo 'CPU WIN'
else
echo '結果'
echo 'プレイヤー WIN'
fi
####################################



