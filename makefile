PACKAGES := $(wildcard packages/*)
FEATURES := $(wildcard lib/)

get:
	echo "Updating dependencies on $(FEATURES)" ;
	fvm flutter pub get
	cd ../../../ ;
	
	for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Updating dependencies on $${package}" ; \
		fvm flutter pub get ; \
		cd ../../ ; \
	done

testing:
	echo "Running test on $(FEATURES)" ;
	fvm flutter test
	cd ../../../ 

	for package in $(PACKAGES); do \
		cd $${package} ; \
		echo "Running test on $${package}" ; \
		fvm flutter test ; \
		cd ../../ ; \
	done