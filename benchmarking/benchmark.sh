wrk -t3 -c100 -d10s --latency -s ./post.lua  https://manager-stores.herokuapp.com/graphql

