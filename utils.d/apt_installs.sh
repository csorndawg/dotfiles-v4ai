
# APT Dependency Installs

APTS=("tree" "xclip" "zip" "unzip"
# uv/ruff
# python3 + py3 venv + py deb
# psycopg2 + apt depends
# postgres + apt depends
# gh
# ansible?
# @TODO: Add nvim-venv setup + install modules script
#
# node/npm
#
"build-essential libpq-dev python3-dev"
"postgresql postgresql-contrib"
"python3 python3-pip python3-dev build-essential cmake"
"python-is-python3"
)

for x in "${APTS[@]}"; do
	#echo -e "\nInstalling:  \"$x\""
	echo -e "\nInstall Cmd:  \"sudo apt install -y \"$x\"\""
	sudo apt install -y "$x"
done


# --------------------------------------------------------
# POST-INSTALL CONFIGURATION
# --------------------------------------------------------

# postgres
sudo systemctl status postgresql
#sudo ufw allow 5432
#sudo -u postgres psql
