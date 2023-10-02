# {{cookiecutter.project_name}}

{{cookiecutter.description}}.

This project provides a structured workflow for creating, parameterizing, executing, and sharing Jupyter notebooks. Leveraging tools like Jupytext and Papermill, this template simplifies the process of managing notebooks in a version-controlled environment.

## Directory Structure

- `notebooks/`
    - `{{cookiecutter.project_slug}}.ipynb`: The raw notebook that serves as the template for execution.
    - `{{cookiecutter.project_slug}}.py`: Script representation of the notebook, generated by Jupytext.
    - `{{cookiecutter.project_slug}}.yaml`: Default parameter values for the notebook.
    - `parameters/`: Directory containing parameter files for different executions, named by Unix timestamp.
    - `executed/`: Directory containing executed notebooks, named by Unix timestamp.
- `docs/`: Directory containing rendered HTML versions of executed notebooks for sharing.

## Setting Up a Virtual Environment using `pyenv` and `virtualenv`

### Prerequisites

Before you begin, ensure that you have `pyenv` and `pyenv-virtualenv` installed. If you haven't, this should work on Mac:
```bash
brew upgrade
brew install pyenv
brew install pyenv-virtualenv
```

And add the following lines to your ``~/.bashrc` or `~/.zshrc`:
```
# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$PYENV_ROOT/shims:${PATH}"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

### Instructions

1. **Install the Desired Python Version**:

    ```bash
    pyenv install {{cookiecutter.python_version}}
    ```

2. **Set up the virtual environment**:

    ```bash
    pyenv virtualenv {{cookiecutter.python_version}} {{cookiecutter.project_slug}}
    ```

3. **Activate the Virtual Environment**:

    ```bash
    pyenv local {{cookiecutter.python_version}}/envs/{{cookiecutter.project_slug}}
    ```

4. **Install Project Dependencies**:

    With your virtual environment activated, you can install necessary packages. For instance:

    ```bash
    pip install -r requirements.txt
    ```


## Workflow

1. **Define Your Notebook**: Update `notebooks/{{cookiecutter.project_slug}}.ipynb` with the desired content and logic. This notebook serves as the template for all executions.

2. **Sync the template notebook and the Python script using:
    ```bash
    make sync
    ```

3. **Parameterise Your Notebook**: Identify cells in your notebook that should be parameterised. These cells should be tagged with the "parameters" tag in Jupyter.

4. **Set Default Parameters**: Update `notebooks/{{cookiecutter.project_slug}}.yaml` with default parameter values.

5. **Generate Parameters**: Whenever you want to execute the notebook with a new set of parameters, generate a new parameter file based on the default using the `generate-params` command. Then, manually adjust the generated file as necessary.

6. **Execute with Parameters**: Use the `execute` command, specifying the desired timestamp (which corresponds to a parameter YAML file). The executed notebook is saved with the same timestamp in the `notebooks/executed/` directory, and converted to HTML format to share via GitHub pages.

Remember, the strength of this workflow lies in its repeatability and structure. By keeping the raw notebook separate from its parameterised executions, you ensure a clean and version-controlled environment for your notebook projects.
