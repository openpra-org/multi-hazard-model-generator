# OpenPRA Multi-Hazard PRA Model Generator 

OpenPRA Multi-Hazard PRA Model Generator is a command-line based generator written in Python. 

OpenMHA Generator is capable of generating multi-hazard event trees and fault trees from internal events PRA models with appropriate event trees and fault trees.

### Capabilities
- ...

# Table of contents
1. [Testing and Coverage](#testing)
2. [Building and Installing](#building)
   - [Using venv](#building-using-venv)
3. [Running OpenMHA Generator](#running-openmha-generator)
   - [Step 1: Setting Environment Variables](#setting-env-vars)
   - [Step 2: Generate PRA Models](#generate-pra-models)
   - [Options and Arguments](#opt-args)
4. [Development Instructions](#development-instructions)
   - [Known Issues](#known-issues)

## <a name="building">Building and Installing</a>
The quickest way to run the tool is using [Docker](https://docs.docker.com/get-started/). With docker installed, all dependencies are handled automatically by the provided [Dockerfile](./Dockerfile).

Begin by cloning the [repository](https://gitlab.openpra.org/openpra/openmha/multi-hazard-pra-model-generator).
```shell
git clone git@gitlab.openpra.org:openpra/openmha/multi-hazard-pra-model-generator.git
```
This should typically create a folder named `multi-hazard-pra-model-generator`, unless otherwise specified. Move into this directory.

### <a name="building-using-venv">Using venv</a>
Alternatively, one can also use `venv`, but all dependencies will have to be managed manually. 

#### Dependencies
| Package    | Tested Version  |
|------------|-----------------|
| Python     | 3.9             |
| distlib    | 0.3.3           |
| pip        | 21.1.1          | 
| setuptools | 56.0.0          |

1. Setup and activate the virtual environment

           On Linux, MacOS:
           `python3 -m venv env`
           `source env/bin/activate`

           On Windows:
           `py -m venv env`
           `.\env\Scripts\activate`

2. Install `pip`, `setuptools`, `distlib`
    ```shell
    python3.9 -m pip install --upgrade pip setuptools distlib
    ```

3. Install all package requirements from [requirements.txt](./requirements.txt)

   | Pip Package | Tested Version  |
   |------------ |-----------------|
   | argparse    |                 |
   | coverage    | 5.5             |


    ```shell
    python3.9 -m pip install -r requirements.txt
    ```
4. Install OpenMHA Generator
    ```shell
    python3.9 setup.py install && \
    python3.9 setup.py sdist && \
    python3.9 -m pip install --no-cache-dir dist/*.tar.gz
    ```

## <a name="running-supra">Running OpenMHA Generator</a>
### <a name="setting-env-vars">Step 1: Setting Environment Variables</a> (optional, recommended)
Optionally, begin by setting the environment variables in the terminal.
```shell
# Input excelsheets Directory
INPUT_DIRS=/mnt/inputs

# Directory to store generated fault tree XMLs
OUTPUT_DIR=/mnt/outputs/
```
### <a name="generate-pra-models">Step 2: Generate PRA Models</a>
```shell
python3.9 -m openmha --generate \
--input-folders $INPUT_DIRS \
--output-folder $OUTPUT_DIR \
```

### <a name="quick-script">Quick Script</a>
A helper script has been provided in [run_script.sh](./run_script.sh).
```shell
docker run -i -v "$(pwd)/outputs:/outputs" \
 --rm supra /bin/bash -c './run_script.sh'
```

### <a name="help-usage">Help & Usage</a>
```shell
usage: __main__.py [-h] -g [-i INPUT_FOLDERS [INPUT_FOLDERS ...]] [-o OUTPUT_FOLDER]

optional arguments:
  -h, --help            show this help message and exit
  -g, --generate        Generate PRA Models
  -i INPUT_FOLDERS [INPUT_FOLDERS ...], --input-folders INPUT_FOLDERS [INPUT_FOLDERS ...]
                        Directory path for input files
  -o OUTPUT_FOLDER, --output-folder OUTPUT_FOLDER
                        Directory path for generated files
```

## <a name="development-instructions">Development Instructions</a>
Checkout the development guide on the repository [Wiki](https://gitlab.openpra.org/openpra/openmha/multi-hazard-pra-model-generator/-/wikis/home).



