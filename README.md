# Remote usage of Jupyter Notebook through Docker

### Introduction

By installing the Dockerfile and the requirements.txt file available on this repository, you'll be able to use Jupyter Notebook with
all the Python Data Science library through the intermediary of Docker.

Thanks to this, you won't have to install all the dependancies again if you need to switch between computers and will be able to
keep your work on your computer regardless of where you are working.


### Preliminary Steps

In order to use Jupyter Notebook remotely through Docker, you'll first need to :
1. Install Docker in your computer : https://docs.docker.com/v17.09/engine/installation/
2. Check if Docker is correctly installed in your computer :
```
docker run hello-world
```
3. Pull this repository to one of your computer folder : 
```
git clone https://github.com/cyriltso/docker_jupyter.git
```
4. Then, go to the folder that contains the Dockerfile and the requirements.txt file :
```
cd /folder_with_Dockerfile_and_requirements
```

### Usage of Docker

Once the preliminary steps done, you have to type the following commands :
1. Build the Jupyter Notebook image through the Dockerfile :
```
docker build -t jupyter-notebook .
```
2. Check if your images has been correctly created :
```
docker images
```
If jupyter-notebook is among your images, it means that it has been successfully created.

3. By default, when you stop your container all the data stored inside are removed, so you will have to create a volume in order 
make your data persists in your container. In Docker, you can do this through the usage of volumes, you can create one by typing :
```
docker volume create jupyter-volume
```
jupyter-store is the name of the volume that will have all my data stored in.

4. Finally, you can run the container built on the jupyter-notebook image :
```
docker run -it -p 8888:8888 -v jupyter-volume:/home jupyter-notebook
```
Here we specify the port number to be able to launch Jupyter Notebook on your host browser, *jupyter-volume:/home* signifies that in
your Jupyter Notebook menu, there will be a folder that will be conserved even after you kill your container (thanks to the volume created earlier), so you will want to store
all the notebooks that you want to keep inside this folder.
