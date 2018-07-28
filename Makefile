.PHONY: deps clean build

deps:
	go get -u ./...

clean: 
	rm -rf ./hello-world/hello-world
	
build:
	GOOS=linux GOARCH=amd64 go build -o hello-world/hello-world ./hello-world

deploy: SHELL:=/bin/bash
deploy:
	sam package --template-file template.yaml --s3-bucket=aws-sam-today --output-template-file packaged.yaml
	aws cloudformation deploy --template-file packaged.yaml --stack-name aws-sam-today --capabilities CAPABILITY_IAM
	aws cloudformation describe-stacks --stack-name aws-sam-today --query 'Stacks[].Outputs'