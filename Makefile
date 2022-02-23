build-clang:
	docker build clang --tag henne90gen/clang:13 --tag henne90gen/clang:latest
build-gtk:
	docker build gtk --tag henne90gen/gtk:4.6 --tag henne90gen/gtk:latest
build-opengl:
	docker build opengl --tag henne90gen/opengl:3.1 --tag henne90gen/opengl:latest
build-webdav:
	docker build webdav --tag henne90gen/webdav:3.12.7 --tag henne90gen/webdav:latest
build-netcup-dyndns:
	docker build netcup-dyndns --tag henne90gen/netcup-dyndns:1.0 --tag henne90gen/netcup-dyndns:latest

test-clang:
	docker build clang/test
test-gtk:
	docker build gtk/test
test-opengl:
	docker build opengl/test
test-webdav:
	./webdav/test/test.sh

push-clang:
	docker push henne90gen/clang -a
push-gtk:
	docker push henne90gen/gtk -a
push-opengl:
	docker push henne90gen/opengl -a
push-webdav:
	docker push henne90gen/webdav -a
push-netcup-dyndns:
	docker push henne90gen/netcup-dyndns -a
