
senkou=0
koukou=0

ww=$((RANDOM %2));
if [ $ww == 0 ] ; then
echo 'プレイヤーは先攻';
senkou=1
else
echo 'プレイヤーは後攻';
koukou=1
fi
if [ $senkou = 1 ]; then
bash ./senkou.sh
else
bash ./koukou.sh
fi




