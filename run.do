vlib work
vlog main.v TB.v
vsim -voptargs=+acc work.TB
add wave *
run -all
#quit -sim