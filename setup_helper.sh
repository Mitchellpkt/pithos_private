#########################################################
echo ------ BEGINNING MISC DEPS INSTALL
echo WARNING THIS WILL MAKE MANY CHANGES TO YOUR SYSTEM
echo THEY MAY OR MAY NOT BE SAFE OR OUTDATED

sudo apt-get install libcairo2-dev
sudo apt install libgirepository1.0-dev
sudo apt install libglib2.0-dev-bin
sudo apt-get install libxml2-utils
pip install --upgrade pip
pip3 install PyGObject

#########################################################
echo ------ BEGINNING MESON POST INSTALL
sudo python3 meson_post_install.py

#########################################################
echo ------ BEGINNING SCHEMA STUFF
# Define the source directory for the schema file
SOURCE_SCHEMA_DIR="./data"

# Define the schema XML file name
SCHEMA_XML_FILE="io.github.Pithos.gschema.xml"

# Define the global schemas directory (usually /usr/share/glib-2.0/schemas)
GLOBAL_SCHEMA_DIR="/usr/share/glib-2.0/schemas"

# Compile the schema in the data/ directory
glib-compile-schemas "$SOURCE_SCHEMA_DIR"

# Copy the schema XML file to the global schemas directory
sudo cp "${SOURCE_SCHEMA_DIR}/${SCHEMA_XML_FILE}" "$GLOBAL_SCHEMA_DIR"

# Navigate to the global schemas directory
cd "$GLOBAL_SCHEMA_DIR"

# Recompile all schemas in the global schemas directory
sudo glib-compile-schemas .

# Print a success message
echo "The schema has been successfully compiled and installed."

# Exit the script
exit 0
