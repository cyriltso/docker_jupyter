# Command to launch in the terminal to run Jupyter Notebook through Docker
# docker run -it -p 8888:8888 -v jupyter-volume:/home jupyter-notebook

# Use the latest ubuntu image as base for the new image
# ubuntu is the image name and latest is a tag that 
# references a particular version of the image.
FROM ubuntu:latest

# Run a system update to get it up to speed
# Then install python3 and pip3
RUN apt-get update && apt-get install -y python3 \
    python3-pip

# Install Jupyter Notebook and Python dependancies along with
# Available in requirements.txt
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Start the jupyter notebook
CMD ["jupyter", "notebook", "--ip=*", "/", "--allow-root"]
