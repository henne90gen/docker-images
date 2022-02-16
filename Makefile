build: build-clang build-gtk build-opengl build-webdav
build-clang:
	docker build clang --tag henne90gen/clang:13 --tag henne90gen/clang:latest
build-gtk:
	docker build gtk --tag henne90gen/gtk:4.6 --tag henne90gen/gtk:latest
build-opengl:
	docker build opengl --tag henne90gen/opengl:3.1 --tag henne90gen/opengl:latest
build-webdav:
	docker build webdav --tag henne90gen/webdav:3.12.7 --tag henne90gen/webdav:latest

test: test-clang test-gtk test-opengl test-webdav
test-clang:
	docker build clang/test
test-gtk:
	docker build gtk/test
test-opengl:
	docker build opengl/test
test-webdav:
	./webdav/test/test.sh

push: push-clang push-gtk push-opengl push-webdav
push-clang:
	docker push henne90gen/clang -a
push-gtk:
	docker push henne90gen/gtk -a
push-opengl:
	docker push henne90gen/opengl -a
push-webdav:
	docker push henne90gen/webdav -a
