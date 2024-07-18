SHELL	:= /bin/bash
VC	:= iverilog
VC_FLAGS	:= -g2012
SRC	:= .
OUT	:= out
EX	:= $(OUT)/test
V_FILES	:= $(wildcard $(SRC)/*.sv)

default	: $(EX)
.SECONDEXPANSION:
$(EX)	: $(V_FILES)| $$(@D)/
	@echo building $(@F)
	$(VC) $(VC_FLAGS) -o $@ $<

./%/: 
	mkdir -p $@

run : $(EX) | 
	vvp $(EX)

clean :
	rm -rf $(OUT)

