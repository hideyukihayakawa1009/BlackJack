

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
############先攻#############
echo 'Player : '$sum1
echo 'CPU : ?'

#終わる条件
j=0;

while true
do
###互いパス###
flag1=0;
flag2=1;
###21を超えた###
flag3=0;
flag4=1;
##############

j=$((++j));

card1=${array[j*2]};
card2=${array[j*2+1]};
if [ card2 == 13 ] ; then
break;
fi
read -p $j'枚目をひきますか？(y/n) : ' n
if [ $n = 'y'] ; then
sum1=$((sum1 + card1));
echo 'Player : '$card1' 合計 : '$sum1
if [ 21 -lt $sum1 ] ; then
echo 'プレイヤー OVER'
flag3=2;
break;
fi
else
echo 'Player : '合計 : '$sum1'
flag1=2;
fi

if [ sum2 -lt 15 ] ; then
sum2=$((sum2 + card2));
echo 'CPU : '$card2' 合計 : '$sum2
if [ 21 -lt $sum2 ] ; then
echo 'CPU OVER'
flag4=2;
break;
fi
else
echo 'CPUは引きませんでした。'
echo 'CPU : '合計 : '$sum2 '
flag2=2;
fi

################お互いパス#############
if [ $flag1 == $flag2 ] ; then
echo '結果'
echo 'プレイヤー : '$sum1
echo 'CPU : '$sum2
if [ $sum1 -lt $sum2 ] ; then
echo 'CPU WIN'
break;
else
echo 'プレイヤー WIN'
break;
fi
fi
##############21超えた##############
if [ $flag3 == $flag4 ] ; then
echo '結果'
echo '引き分け'
break;
elif [ flag3 == 2 ] ; then
echo '結果'
echo 'CPU WIN'
break;
else
echo '結果'
echo 'プレイヤー WIN'
break;
fi
####################################
done