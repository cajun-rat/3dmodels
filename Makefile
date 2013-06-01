all: 20.dxf

%.eps: %.svg
	inkscape -E $@ $<

%.dxf: %.eps
	pstoedit -q -dt -f dxf:"-polyaslines -mm" $< $@

housenumber.stl: housenumber.scad 20.dxf

tentpeg.stl: tentpeg.scad tentpeg.dxf

%.stl: %.scad
	openscad -o $@ $<


