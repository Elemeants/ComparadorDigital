CC  = iverilog
VVP = vvp
GTK_WAVE = gtkwave
CC_FLAGS = -Winfloop

OUT_FILENAME = simulation.out
WAVE_FILENAME = simulation.vcd

MAIN_VERILOG_FILE = comparator_sim.v

build:
	@echo Compiling verilog file...
	@${CC} ${CC_FLAGS} -o ${OUT_FILENAME} ${MAIN_VERILOG_FILE}

${WAVE_FILENAME}:
	@echo Simulating verilog file...
	@${VVP} ${OUT_FILENAME}

simulate: ${WAVE_FILENAME}
	@echo Opening GTKWave with simulation
	@${GTK_WAVE} ${WAVE_FILENAME} config.gtkw

run: build simulate