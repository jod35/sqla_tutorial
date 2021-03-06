all: zip

zip: sqlalchemy_tutorial.zip

sqlalchemy_tutorial.zip: build/handout.pdf build/sw build
	cd build; zip -r ../sqlalchemy_tutorial.zip .; cd ..;

build/handout.pdf: build
	cd handout; make latexpdf; cp build/latex/handout.pdf ../build/; cd ..;

build/sw: build
	cd slides; cp *.py README requirements.txt ../build/; cp -R sw	../build/; cd ..;

build:
	mkdir build

cleanpdf:
	cd handout; make clean; cd ..;

cleanzip:
	rm sqlalchemy_tutorial.zip

clean: cleanpdf cleanzip
	rm -fr build
