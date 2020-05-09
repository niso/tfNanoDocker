FROM nvcr.io/nvidia/l4t-base:r32.4.2

MAINTAINER Genis Virgili <genis.virgili@gmail.com>

ARG DEBIAN_FRONTEND=noninteractive
ARG PIP_CONFIG_FILE=pip.conf
ARG MPLLOCALFREETYPE=1
COPY pip.conf .

RUN apt update && apt install -y libhdf5-serial-dev hdf5-tools \
	libhdf5-dev zlib1g-dev zip libjpeg8-dev \
	liblapack-dev libblas-dev gfortran libpng-dev python3-pip pkg-config \
	&& pip3 install -U pip testresources setuptools

RUN pip3 install -U numpy==1.16.1 future==0.17.1 mock==3.0.5 h5py==2.9.0 \
	keras_preprocessing==1.0.5 keras_applications==1.0.8 gast==0.2.2 \
	futures protobuf pybind11 && pip3 install tensorflow \
	&& pip3 install -U matplotlib pandas jupyterlab

EXPOSE 8888 6006

RUN mkdir -p /notebooks

CMD ["jupyter-lab", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--notebook-dir='/notebooks'"]
