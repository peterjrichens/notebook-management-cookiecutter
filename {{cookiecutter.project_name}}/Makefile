RAW_NOTEBOOK = notebooks/{{cookiecutter.project_slug}}.ipynb
DEFAULT_PARAMS = notebooks/{{cookiecutter.project_slug}}.yaml
SCRIPT = notebooks/{{cookiecutter.project_slug}}.py
PARAM_DIR = notebooks/parameters
EXECUTED_DIR = notebooks/executed
PUBLISH_DIR = docs

# Update whichever of notebooks/{{cookiecutter.project_slug}}.ipynb or notebooks/{{cookiecutter.project_slug}}.py is outdated
sync:
	@echo "Syncing notebook $(RAW_NOTEBOOK) and script $(SCRIPT)..."
	jupytext --set-formats ipynb,py $(SCRIPT)
	jupytext --sync $(SCRIPT)
	@echo "Sync done."

raw-notebook: sync
	jupyter notebook $(RAW_NOTEBOOK)

# Generate a new parameter file using the default template
generate-params:
	@echo "Generating new parameter file from default..."
	@timestamp=$(shell date +%s) &&\
		cp $(DEFAULT_PARAMS) $(PARAM_DIR)/$$timestamp.yaml &&\
		echo "New parameter file $$timestamp.yaml created."

# Execute notebook using the parameter file with provided timestamp (eg. make execute TIMESTAMP=1234567890)
execute: sync
	@echo "Executing notebook $(RAW_NOTEBOOK) with parameters $(PARAM_DIR)/$(TIMESTAMP).yaml..."
	papermill $(RAW_NOTEBOOK) $(EXECUTED_DIR)/$(TIMESTAMP).ipynb -f $(PARAM_DIR)/$(TIMESTAMP).yaml
	jupyter nbconvert --to html $(EXECUTED_DIR)/$(TIMESTAMP).ipynb --output-dir $(PUBLISH_DIR) --output $(TIMESTAMP).html; \
	@echo "Execution done."

doc-index:
	@echo "Updating docs/index.html..." &&\
	./docs/update-index.sh
	@echo "Index update done."

.PHONY: sync generate-params execute doc-index
