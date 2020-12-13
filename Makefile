

cycle: build run

prepare:
	git clone https://github.com/spring-guides/gs-spring-boot.git

build:
	podman build -t runner .

run:
	podman run -p 8080:8080 runner

