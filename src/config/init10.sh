#!/bin/sh
LOOP_ITERATION_COUNT=10
n=0
echo 'starting init03 , pid='$$

## fake setup execution
until [ "$n" -ge "$LOOP_ITERATION_COUNT" ]
do
   sync
   n=$[$n+1]
   echo '[STDERR] ITERATION N = '${n}' '  >&2
   echo '[STDOUT] ITERATION N = '${n}' '
   sleep 1
done

echo 'starting MAIN APP!'
chmod +x /app/app1.sh
exec /app/app1.sh
echo 'main app execution terminated'