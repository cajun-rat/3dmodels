
all: 20.dxf


%.eps: %.svg
	inkscape -E $@ $<

%.dxf: %.eps
	pstoedit -q -dt -f dxf:"-polyaslines -mm" $< $@
