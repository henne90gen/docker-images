build: build-clang build-gtk build-webdav
build-clang:
	docker build clang --tag henne90gen/clang:13 --tag henne90gen/clang:latest
build-gtk:
	docker build gtk --tag henne90gen/gtk:4.4 --tag henne90gen/gtk:latest
build-webdav:
	docker build webdav --tag henne90gen/webdav:3.12.7 --tag henne90gen/webdav:latest

test: test-clang test-gtk test-webdav
test-clang:
	docker build clang/test
test-gtk:
	docker build gtk/test
test-webdav:
	./webdav/test/test.sh

push: push-clang push-gtk push-webdav
push-clang:
	docker push henne90gen/clang -a
push-gtk:
	docker push henne90gen/gtk -a
push-webdav:
	docker push henne90gen/webdav -a
