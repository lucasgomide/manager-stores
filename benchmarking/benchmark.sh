DIR=`pwd`
wrk -t3 -c100 -d10s --latency -s $DIR/benchmarking/post.lua  https://manager-stores.herokuapp.com/graphql

