# crypto-trading-tools
There crypto trading tools to help your trading easier.

## Usage

if don't have poetry, can install it by running the following command:
```bash
pip install poetry
```

### Activate environment
if you are using poetry, you can activate the environment by running the following command:
```bash
./scripts/activate_env.sh
```

if you just want to run you scripts, can activate the environment and run the following command:
```bash
python -m dags.your_model.your_script
```

### about code style
isort and black/flake8 are used to format the code.
please run the following command to format the code:
```bash
poetry run isort .
poetry run black .
poetry run flake8 .
```
or you can use pre-commit to check the code style:
```bash
poetry run pre-commit run --your-files
```
then you can commit you changed.



