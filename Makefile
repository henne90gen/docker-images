build: build-clang build-gtk
build-clang:
	docker build clang --tag henne90gen/clang:13 --tag henne90gen/clang:latest
build-gtk:
	docker build gtk --tag henne90gen/gtk:4.4 --tag henne90gen/gtk:latest

test: test-clang test-gtk
test-clang:
	docker build clang/test
test-gtk:
	docker build gtk/test

push: push-clang push-gtk
push-clang:
	docker push henne90gen/clang -a
push-gtk:
	docker push henne90gen/gtk -a
