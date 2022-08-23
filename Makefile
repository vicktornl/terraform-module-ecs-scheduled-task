format:
	terraform fmt -diff=true -write=true -recursive .

docs:
	terraform-docs markdown table --output-file README.md --output-mode inject .
