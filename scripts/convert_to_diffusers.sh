#!/bin/bash

R='\033[0;31m' #red
G='\033[0;32m' #green
N='\033[0m' #none
# Those are used to modify the text color

SECONDS=0
# Starts counting time

source /Users/YOUR-NAME/miniconda3/etc/profile.d/conda.sh
# Replace "YOUR-NAME" with your username. If Miniconda has been installed in a different folder than your user home folder, choose that path instead. To copy a folder path, simply right-click on a folder, press the Option key, and choose "Copy "FOLDER-NAME" as pathname"

conda activate coreml_stable_diffusion
# This activate the conda coreml_stable_diffusion environment

cd FOLDER-WITH-convert_original_stable_diffusion_to_diffusers.py
# Replace the line after "cd " with the folder path where the python script is located at

until
	python ./convert_original_stable_diffusion_to_diffusers.py --checkpoint_path "./model.ckpt" --device cpu --extract_ema --dump_path "./diffusers"
	# This is the conversion command. You can change "./model.ckpt" with your model name (e.g. "./MODEL-NAME.ckpt"), or leave it as it is and rename your CKPT file to "model.ckpt". It's easier to do the latter, since you don't have to edit this script every time you convert a model with a different name
do
	afplay /System/Library/Sounds/Sosumi.aiff -v 5
	# Plays a sound if the conversion fails. "-v" is volume. You can also use: say "error"; Siri will pronunce it for you. Or remove it altogether if you don't like it
	echo -e "\n\n"
	# Displays three empty lines
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	# Displays a divider large as the Terminal window
	echo -e "${R}Conversion to DIFFUSERS failed. Retrying conversion in 10 seconds...${N}"
	# Displays a message. "${R}" and "${N}" are for the text color
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	# Divider again
	echo -e "\n\n"
	# Empty lines
	sleep 10
	# This command will run until it's successful. In case it fails multiple times, check the Terminal log to see if there's something that needs to be adjusted. The number after "sleep" tells the command how long it should wait to try again
done

duration=$SECONDS
# Sets the "duration" command
echo -e "\n\n"
# Displays three empty lines
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
# Displays a divider large as the Terminal window
echo -e "${G}Conversion to DIFFUSERS completed in $(($duration / 60))min and $(($duration % 60))s.${N}"
# Displays a message with the execution time. "${G}" and "${N}" are for the text color
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
# Divider again
echo -e "\n\n"
# Empty lines

afplay /System/Library/Sounds/Funk.aiff -v 5
# Plays a sound if the conversion is successful

# Wiki: https://github.com/godly-devotion/MochiDiffusion/wiki/How-to-convert-ckpt-or-safetensors-files-to-Core-ML
# FAQ: https://github.com/godly-devotion/MochiDiffusion/wiki/Frequently-Asked-Questions
# Hugging Face: https://huggingface.co/coreml
# Discord: https://discord.gg/x2kartzxGv

# You can erase all the comments preceded by the # symbol
# Just don't erase #!/bin/bash ;)
# Have fun! — Zabriskije