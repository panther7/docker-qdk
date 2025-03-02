build:
	docker build -t docker-qdk .

help: build
	docker run --rm docker-qdk -help

extract:
	docker run -v $(PWD)/qpkg:/src --rm docker-qdk --extract '*.qpkg'

example: build
	rm -rvf example
	docker run -v $(PWD):/src --rm docker-qdk --create-env example
	docker run -v $(PWD)/example:/src --rm docker-qdk .

clean:
	git reset --hard
	git pull
	git --no-pager log -1
