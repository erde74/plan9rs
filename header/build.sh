# INC="-I/home/stefan/Devel/plan9/plan9-contrib/amd64/include/ -I/home/stefan/Devel/plan9/plan9-contrib/sys/src/9k/k10/" 
INC="-I."

bindgen --use-core dat_rs.h -- $INC > dat.rs
