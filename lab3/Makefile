# Makefile automatically generated by ghdl
# Version: GHDL 1.0.0 (tarball) [Dunoon edition] - llvm code generator
# Command used to generate this makefile:
# ghdl --gen-makefile jk_tb

GHDL=ghdl
GHDLFLAGS=

# Default target
all: jk_tb

# Elaboration target
jk_tb: /usr/lib/ghdl/ieee/v93/std_logic_1164.o /usr/lib/ghdl/ieee/v93/std_logic_1164-body.o inv.o /usr/lib/ghdl/ieee/v93/std_logic_misc.o /usr/lib/ghdl/ieee/v93/std_logic_misc-body.o and_gate.o nor_gate.o jk.o jk_tb.o
	$(GHDL) -e $(GHDLFLAGS) $@

# Run target
run: jk_tb
	$(GHDL) -r jk_tb $(GHDLRUNFLAGS) --wave=jk_tb.ghw

# Targets to analyze files
/usr/lib/ghdl/ieee/v93/std_logic_1164.o: /usr/lib/ghdl/ieee/v93/../../src/ieee/v93/std_logic_1164.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v93/std_logic_1164-body.o: /usr/lib/ghdl/ieee/v93/../../src/ieee/v93/std_logic_1164-body.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
inv.o: ./inv.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<
/usr/lib/ghdl/ieee/v93/std_logic_misc.o: /usr/lib/ghdl/ieee/v93/../../src/synopsys/std_logic_misc.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v93/std_logic_misc-body.o: /usr/lib/ghdl/ieee/v93/../../src/synopsys/std_logic_misc-body.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
and_gate.o: ./and_gate.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<
nor_gate.o: ./nor_gate.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<
jk.o: ./jk.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<
jk_tb.o: ./jk_tb.vhdl
	$(GHDL) -a $(GHDLFLAGS) $<

# Files dependences
/usr/lib/ghdl/ieee/v93/std_logic_1164.o: 
/usr/lib/ghdl/ieee/v93/std_logic_1164-body.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o
inv.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o
/usr/lib/ghdl/ieee/v93/std_logic_misc.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o
/usr/lib/ghdl/ieee/v93/std_logic_misc-body.o:  /usr/lib/ghdl/ieee/v93/std_logic_misc.o
and_gate.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o /usr/lib/ghdl/ieee/v93/std_logic_misc.o /usr/lib/ghdl/ieee/v93/std_logic_misc-body.o
nor_gate.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o /usr/lib/ghdl/ieee/v93/std_logic_misc.o
jk.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o inv.o and_gate.o nor_gate.o
jk_tb.o:  /usr/lib/ghdl/ieee/v93/std_logic_1164.o /usr/lib/ghdl/ieee/v93/std_logic_1164-body.o jk.o
