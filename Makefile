all:
	rm -fr bin
	rm -fr bootstrap
	rm -f compiler/srefc compiler/srefc-s compiler/srefc_
	mkdir -p bootstrap
	cp -r bkcp/bootstrap ./
	# cp bkcp/compiler/srefc compiler/srefc
	# cp bkcp/compiler/srefc_ compiler/srefc_
	# cp bkcp/compiler/srefc-s compiler/srefc-s