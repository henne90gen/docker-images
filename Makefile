build-clang:
	docker build clang --tag henne90gen/clang:13 --tag henne90gen/clang:latest

test-clang:
	docker build test --file test/Dockerfile_clang

build-gtk:
	docker build gtk --tag henne90gen/gtk:4.4 --tag henne90gen/gtk:4 --tag henne90gen/gtk:latest

test-gtk:
	docker build test --file test/Dockerfile_gtk
